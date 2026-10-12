#!/usr/bin/env python3
"""Validate normal public Homebrew downloads at the platform's standard prefix."""
import json
import os
import platform
import shutil
import subprocess
import tempfile
import urllib.request
from pathlib import Path

FORMULA = "bibleit-labs/tap/bibleit-cli"
VERSION = "0.0.2"
ROOT = Path(__file__).resolve().parent.parent


def main():
    env = {k: v for k, v in os.environ.items() if "TOKEN" not in k.upper() and "SECRET" not in k.upper() and not k.startswith("GIT_")}
    env.update(GIT_CONFIG_GLOBAL=os.devnull, GIT_CONFIG_SYSTEM=os.devnull, GIT_TERMINAL_PROMPT="0", HOMEBREW_NO_AUTO_UPDATE="1")
    def run(args):
        result = subprocess.run(args, env=env, check=True, capture_output=True, text=True, timeout=600)
        print(" ".join(args) + "\n" + result.stdout + result.stderr, flush=True)
        return result.stdout.strip()
    prefix = run(["brew", "--prefix"])
    expected = "/home/linuxbrew/.linuxbrew" if platform.system() == "Linux" else ("/opt/homebrew" if platform.machine() == "arm64" else "/usr/local")
    assert prefix == expected, (prefix, expected)
    notices = {}
    for name in ("LICENSE", "THIRD_PARTY_NOTICES"):
        with urllib.request.urlopen("https://raw.githubusercontent.com/bibleit-labs/bibleit-cli/v" + VERSION + "/" + name, timeout=120) as response:
            notices[name] = response.read()
    checks = []
    with tempfile.TemporaryDirectory(prefix="bibleit-brew-cache-") as temporary:
        cache = Path(temporary) / "cache"
        env["HOMEBREW_CACHE"] = str(cache)
        run(["brew", "tap", "bibleit-labs/tap", "https://github.com/bibleit-labs/homebrew-tap"])
        for operation in ("install", "reinstall"):
            if cache.exists():
                shutil.rmtree(cache)
            cache.mkdir()
            run(["brew", operation, FORMULA])
            run(["brew", "test", FORMULA])
            installed = Path(run(["brew", "--prefix", FORMULA]))
            binary = installed / "bin/bibleit"
            assert run([str(binary), "version"]) == "bibleit CLI version " + VERSION
            run([str(binary), "--help"])
            for name, expected_bytes in notices.items():
                assert (installed / "share/bibleit-cli" / name).read_bytes() == expected_bytes
            for path in ("etc/bash_completion.d/bibleit", "share/zsh/site-functions/_bibleit", "share/fish/vendor_completions.d/bibleit.fish"):
                assert (installed / path).stat().st_size > 0, path
            checks.append({"operation": operation, "initial_download_cache": "empty", "brew_test_version_help_notices_completions": "passed"})
        run(["brew", "uninstall", FORMULA])
        assert not (Path(prefix) / "bin/bibleit").exists()
        checks.append({"operation": "uninstall", "binary_removed": True})
    report = ROOT / "build/validation/public-homebrew.json"
    report.parent.mkdir(parents=True, exist_ok=True)
    report.write_text(json.dumps({"formula": FORMULA, "version": VERSION, "platform": platform.platform(), "machine": platform.machine(), "prefix": prefix, "credentials": False, "local_archive_overrides": False, "checks": checks}, indent=2) + "\n")


if __name__ == "__main__":
    main()

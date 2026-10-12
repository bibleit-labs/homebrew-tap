"""Prove the runner and installed executable match the requested native target."""
import os
import platform
import struct
import subprocess

TARGETS = {
    "macos-15": ("Darwin", "arm64"),
    "macos-15-intel": ("Darwin", "amd64"),
    "ubuntu-24.04": ("Linux", "amd64"),
    "ubuntu-24.04-arm": ("Linux", "arm64"),
}


def native_host():
    system = platform.system()
    machine = platform.machine()
    architecture = {"x86_64": "amd64", "AMD64": "amd64", "aarch64": "arm64", "arm64": "arm64"}.get(machine)
    if system not in ("Darwin", "Linux") or architecture is None:
        raise RuntimeError(f"unsupported Homebrew host: {system}/{machine}")
    runner = os.environ.get("EXPECTED_HOMEBREW_RUNNER")
    if runner and TARGETS[runner] != (system, architecture):
        raise RuntimeError(f"runner {runner} has unexpected host: {system}/{machine}")
    if runner and os.environ.get("RUNNER_ARCH") != {"amd64": "X64", "arm64": "ARM64"}[architecture]:
        raise RuntimeError("GitHub runner architecture differs from the native host")
    translated = False
    if system == "Darwin":
        result = subprocess.run(["sysctl", "-in", "sysctl.proc_translated"], capture_output=True, text=True, check=True)
        translated = result.stdout.strip() == "1"
        if translated:
            raise RuntimeError("Rosetta execution cannot establish native Homebrew coverage")
    return {"runner": runner, "system": system, "machine": machine, "architecture": architecture, "translated": translated}


def verify_binary(path, host):
    with path.open("rb") as executable:
        header = executable.read(32)
    if len(header) >= 20 and header[:4] == b"\x7fELF" and header[4:6] == b"\x02\x01":
        system = "Linux"
        architecture = {62: "amd64", 183: "arm64"}.get(struct.unpack_from("<H", header, 18)[0])
    elif len(header) >= 8 and header[:4] == b"\xcf\xfa\xed\xfe":
        system = "Darwin"
        architecture = {0x01000007: "amd64", 0x0100000C: "arm64"}.get(struct.unpack_from("<I", header, 4)[0])
    else:
        raise RuntimeError("expected a thin 64-bit ELF or Mach-O executable")
    if (system, architecture) != (host["system"], host["architecture"]):
        raise RuntimeError(f"installed binary {system}/{architecture} differs from native host")
    return {"system": system, "architecture": architecture, "matches_native_host": True}

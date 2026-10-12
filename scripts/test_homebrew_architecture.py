import struct
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from check_homebrew_architecture import native_host, verify_binary


class ArchitectureTests(unittest.TestCase):
    def test_binary_headers_and_wrong_target(self):
        for system, architecture, code in (("Linux", "amd64", 62), ("Linux", "arm64", 183), ("Darwin", "amd64", 0x01000007), ("Darwin", "arm64", 0x0100000C)):
            with self.subTest(system=system, architecture=architecture), tempfile.TemporaryDirectory() as directory:
                header = bytearray(32)
                if system == "Linux":
                    header[:6] = b"\x7fELF\x02\x01"
                    struct.pack_into("<H", header, 18, code)
                else:
                    header[:4] = b"\xcf\xfa\xed\xfe"
                    struct.pack_into("<I", header, 4, code)
                binary = Path(directory) / "bibleit"
                binary.write_bytes(header)
                self.assertTrue(verify_binary(binary, {"system": system, "architecture": architecture})["matches_native_host"])
                with self.assertRaises(RuntimeError):
                    verify_binary(binary, {"system": system, "architecture": "arm64" if architecture == "amd64" else "amd64"})

    @patch("check_homebrew_architecture.platform.system", return_value="Linux")
    @patch("check_homebrew_architecture.platform.machine", return_value="aarch64")
    def test_native_linux_arm_and_runner_mismatch(self, *_):
        with patch.dict("os.environ", {"EXPECTED_HOMEBREW_RUNNER": "ubuntu-24.04-arm", "RUNNER_ARCH": "ARM64"}):
            self.assertEqual(native_host()["architecture"], "arm64")
        with patch.dict("os.environ", {"EXPECTED_HOMEBREW_RUNNER": "ubuntu-24.04", "RUNNER_ARCH": "X64"}):
            with self.assertRaises(RuntimeError):
                native_host()

    @patch("check_homebrew_architecture.platform.system", return_value="Darwin")
    @patch("check_homebrew_architecture.platform.machine", return_value="x86_64")
    @patch("check_homebrew_architecture.subprocess.run")
    def test_rosetta_rejected(self, run, *_):
        run.return_value.stdout = "1\n"
        with patch.dict("os.environ", {"EXPECTED_HOMEBREW_RUNNER": "macos-15-intel", "RUNNER_ARCH": "X64"}):
            with self.assertRaisesRegex(RuntimeError, "Rosetta"):
                native_host()

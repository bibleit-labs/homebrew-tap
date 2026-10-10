import hashlib
import json
from pathlib import Path
import tempfile
import unittest
from update_formula import validate_version, verified_formula

class FormulaUpdateTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.assets = Path(self.tmp.name)
        self.version = 'v0.1.0'
        hashes = {}
        lines = ['class BibleitCli < Formula', '  version "0.1.0"']
        for system in ('darwin', 'linux'):
            for arch in ('arm64', 'amd64'):
                name = f'bibleit_0.1.0_{system}_{arch}.tar.gz'
                data = name.encode()
                (self.assets / name).write_bytes(data)
                hashes[name] = hashlib.sha256(data).hexdigest()
                lines += [f'  url "https://github.com/bibleit-labs/bibleit-cli/releases/download/{self.version}/{name}"', f'  sha256 "{hashes[name]}"']
        self.formula = '\n'.join(lines + ['end', ''])
        (self.assets / 'bibleit-cli.rb').write_text(self.formula)
        self.manifest = dict(version=self.version, local_only=False, dirty=False, artifacts=hashes)
        self.write_manifest()
        (self.assets / 'checksums.txt').write_text(''.join(f'{sha}  {name}\n' for name, sha in hashes.items()))

    def write_manifest(self):
        (self.assets / 'manifest.json').write_text(json.dumps(self.manifest))

    def test_verified_formula_is_copied_unchanged(self):
        self.assertEqual(verified_formula(self.version, self.assets), self.formula)

    def test_versions_cannot_be_shell_or_path_input(self):
        for value in ('v1', '../v0.1.0', 'v0.1.0;echo', 'v0.1.0\n', '--latest', 'v01.0.0'):
            with self.subTest(value=value), self.assertRaises(ValueError):
                validate_version(value)

    def test_corrupt_archive(self):
        next(self.assets.glob('*.tar.gz')).write_bytes(b'corrupt')
        with self.assertRaises(ValueError):
            verified_formula(self.version, self.assets)

    def test_development_or_dirty_manifest(self):
        for key, value in [('local_only', True), ('dirty', True), ('version', 'v9.0.0')]:
            original = self.manifest[key]
            self.manifest[key] = value
            self.write_manifest()
            with self.assertRaises(ValueError):
                verified_formula(self.version, self.assets)
            self.manifest[key] = original

    def test_duplicate_checksum(self):
        p = self.assets / 'checksums.txt'
        p.write_text(p.read_text() + p.read_text().splitlines()[0] + '\n')
        with self.assertRaises(ValueError):
            verified_formula(self.version, self.assets)

    def test_foreign_or_duplicate_formula_urls(self):
        for text in (self.formula.replace('bibleit-labs/bibleit-cli', 'foreign/cli'), self.formula + self.formula):
            (self.assets / 'bibleit-cli.rb').write_text(text)
            with self.assertRaises(ValueError):
                verified_formula(self.version, self.assets)

    def test_manifest_hash_mismatch(self):
        self.manifest['artifacts'][next(iter(self.manifest['artifacts']))] = '0' * 64
        self.write_manifest()
        with self.assertRaises(ValueError):
            verified_formula(self.version, self.assets)

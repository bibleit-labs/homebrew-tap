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
        self.manifest = dict(version=self.version, local_only=False, dirty=False, artifacts=hashes, client=dict(workspace=False, Version="v0.0.0-20261011144051-464d86d7dd41", Sum="h1:fixture"))
        self.write_manifest()
        (self.assets / 'checksums.txt').write_text(''.join(f'{sha}  {name}\n' for name, sha in hashes.items()))

    def write_manifest(self):
        (self.assets / 'manifest.json').write_text(json.dumps(self.manifest))

    def test_stable_formula_omits_only_redundant_version(self):
        expected = self.formula.replace('  version "0.1.0"\n', '')
        self.assertEqual(verified_formula(self.version, self.assets), expected)

    def test_mismatched_explicit_version_is_rejected(self):
        (self.assets / 'bibleit-cli.rb').write_text(self.formula.replace('version "0.1.0"', 'version "9.0.0"'))
        with self.assertRaises(ValueError):
            verified_formula(self.version, self.assets)

    def test_prerelease_version_is_preserved(self):
        for p in list(self.assets.iterdir()):
            text = p.read_text().replace('0.1.0', '0.1.0-rc.1')
            p.write_text(text)
            if '0.1.0' in p.name:
                p.rename(p.with_name(p.name.replace('0.1.0', '0.1.0-rc.1')))
        manifest = json.loads((self.assets / 'manifest.json').read_text())
        hashes = {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in self.assets.glob('*.tar.gz')}
        manifest['artifacts'] = hashes
        (self.assets / 'manifest.json').write_text(json.dumps(manifest))
        text = (self.assets / 'bibleit-cli.rb').read_text()
        for oldname, oldhash in self.manifest['artifacts'].items():
            text = text.replace(oldhash, hashes[oldname.replace('0.1.0', '0.1.0-rc.1')])
        (self.assets / 'bibleit-cli.rb').write_text(text)
        (self.assets / 'checksums.txt').write_text(''.join(f'{sha}  {name}\n' for name, sha in hashes.items()))
        self.assertEqual(verified_formula('v0.1.0-rc.1', self.assets), text)

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

    def test_workspace_or_unpinned_client_is_rejected(self):
        for client in ({}, dict(workspace=True, Version='v0.1.0', Sum='h1:fixture'), dict(workspace=False, Version='v0.1.0')):
            self.manifest['client'] = client
            self.write_manifest()
            with self.assertRaises(ValueError):
                verified_formula(self.version, self.assets)

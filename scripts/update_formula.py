#!/usr/bin/env python3
"""Verify released CLI assets and copy its generated Homebrew formula."""
import argparse
import hashlib
import json
from pathlib import Path
import re

VERSION = re.compile(r'v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(?:-[0-9A-Za-z]+(?:[.-][0-9A-Za-z]+)*)?\Z')

def validate_version(version):
    if not VERSION.fullmatch(version):
        raise ValueError('expected vMAJOR.MINOR.PATCH with optional prerelease')

def verified_formula(version, assets):
    validate_version(version)
    manifest = json.loads((assets / 'manifest.json').read_text())
    if manifest.get('version') != version or manifest.get('local_only') is not False or manifest.get('dirty') is not False:
        raise ValueError('release must contain a clean production manifest for the selected version')
    client = manifest.get('client', {})
    if client.get('workspace') is not False or not client.get('Version') or not client.get('Sum'):
        raise ValueError('release must use a pinned, checksummed standalone Go client')
    checksums = {}
    for line in (assets / 'checksums.txt').read_text().splitlines():
        sha, name = line.split()
        if not re.fullmatch(r'[0-9a-f]{64}', sha) or name in checksums:
            raise ValueError('invalid or duplicate checksum')
        checksums[name] = sha
    text = (assets / 'bibleit-cli.rb').read_text()
    urls = re.findall(r'^\s*url "([^"]+)"$', text, re.M)
    hashes = re.findall(r'^\s*sha256 "([^"]+)"$', text, re.M)
    if not text.startswith('class BibleitCli < Formula\n') or re.findall(r'^\s*version "([^"]+)"$', text, re.M) != [version[1:]]:
        raise ValueError('unexpected formula class or version')
    expected = {}
    for system in ('darwin', 'linux'):
        for arch in ('arm64', 'amd64'):
            name = f'bibleit_{version[1:]}_{system}_{arch}.tar.gz'
            sha = hashlib.sha256((assets / name).read_bytes()).hexdigest()
            if checksums.get(name) != sha or manifest.get('artifacts', {}).get(name) != sha:
                raise ValueError(f'archive checksum mismatch: {name}')
            expected[f'https://github.com/bibleit-labs/bibleit-cli/releases/download/{version}/{name}'] = sha
    if len(urls) != 4 or len(hashes) != 4 or len(set(urls)) != 4 or dict(zip(urls, hashes)) != expected:
        raise ValueError('formula URLs/checksums do not match the released archives')
    return text

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--version', required=True)
    parser.add_argument('--validate-version', action='store_true')
    parser.add_argument('--assets', type=Path)
    parser.add_argument('--output', type=Path, default=Path('Formula/bibleit-cli.rb'))
    args = parser.parse_args()
    validate_version(args.version)
    if args.validate_version:
        return
    if args.assets is None:
        parser.error('--assets is required')
    text = verified_formula(args.version, args.assets)
    args.output.write_text(text)
    print(f'Verified release formula: {args.version}')

if __name__ == '__main__':
    main()

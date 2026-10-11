#!/usr/bin/env python3
"""Validate a released formula using the immutable CLI's Homebrew helper."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile
from update_formula import verified_formula


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--assets', required=True, type=Path)
    parser.add_argument('--formula', required=True, type=Path)
    parser.add_argument('--helper', required=True, type=Path)
    parser.add_argument('--report', required=True, type=Path)
    args = parser.parse_args()
    manifest = json.loads((args.assets / 'manifest.json').read_text())
    version = manifest['version']
    original = args.formula.read_text()
    if original != verified_formula(version, args.assets):
        raise ValueError('tap formula differs from verified released formula')
    # The released helper rewrites HTTPS URLs to file URLs. Homebrew then loses
    # the release-tag path and may infer the architecture suffix as its version.
    # Preserve the verified production version only in the disposable fixture.
    fixture = original
    explicit = not re.search(r'^\s*version "', fixture, re.M)
    if explicit:
        fixture = fixture.replace('class BibleitCli < Formula\n',
                                  f'class BibleitCli < Formula\n  version "{version[1:]}"\n', 1)
    args.report.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='formula-fixture-', dir=args.report.parent) as directory:
        formula = Path(directory) / 'bibleit-cli.rb'
        formula.write_text(fixture)
        # The isolated Homebrew prefix does not need the runner's global Git
        # credentials; public core metadata can be cloned without them.
        env = dict(os.environ, GIT_CONFIG_GLOBAL=os.devnull)
        subprocess.run([sys.executable, str(args.helper), '--assets', str(args.assets),
                        '--formula', str(formula), '--report', str(args.report)],
                       env=env, check=True)
    report = json.loads(args.report.read_text())
    report['published_formula_sha256'] = hashlib.sha256(args.formula.read_bytes()).hexdigest()
    report['released_helper_sha256'] = hashlib.sha256(args.helper.read_bytes()).hexdigest()
    report['fixture_explicit_version'] = explicit
    report['git_configuration_isolated'] = True
    args.report.write_text(json.dumps(report, indent=2) + '\n')


if __name__ == '__main__':
    main()

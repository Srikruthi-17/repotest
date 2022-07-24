#!/usr/bin/env bash
set -euo pipefail

pushd binary-releases
shasum -a 256 -c repotest-alpine.sha256
shasum -a 256 -c repotest-linux.sha256
shasum -a 256 -c repotest-linux-arm64.sha256
shasum -a 256 -c repotest-macos.sha256
shasum -a 256 -c repotest-win.exe.sha256
shasum -a 256 -c repotest-for-docker-desktop-darwin-x64.tar.gz.sha256
shasum -a 256 -c repotest-for-docker-desktop-darwin-arm64.tar.gz.sha256
shasum -a 256 -c docker-mac-signed-bundle.tar.gz.sha256
shasum -a 256 -c repotest-fix.tgz.sha256
shasum -a 256 -c repotest-protect.tgz.sha256
shasum -a 256 -c repotest.tgz.sha256
gpg --import ../help/_about-this-project/repotest-code-signing-public.pgp
gpg --verify sha256sums.txt.asc
popd

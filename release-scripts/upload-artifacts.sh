#!/usr/bin/env bash
set -euo pipefail

declare -a StaticFiles=(
  "binary-releases/repotest-alpine"
  "binary-releases/repotest-linux"
  "binary-releases/repotest-linux-arm64"
  "binary-releases/repotest-macos"
  "binary-releases/repotest-win.exe"
  "binary-releases/repotest-for-docker-desktop-darwin-x64.tar.gz"
  "binary-releases/repotest-for-docker-desktop-darwin-arm64.tar.gz"
  "binary-releases/docker-mac-signed-bundle.tar.gz"
  "binary-releases/repotest-alpine.sha256"
  "binary-releases/repotest-linux.sha256"
  "binary-releases/repotest-linux-arm64.sha256"
  "binary-releases/repotest-macos.sha256"
  "binary-releases/repotest-win.exe.sha256"
  "binary-releases/repotest-for-docker-desktop-darwin-x64.tar.gz.sha256"
  "binary-releases/repotest-for-docker-desktop-darwin-arm64.tar.gz.sha256"
  "binary-releases/docker-mac-signed-bundle.tar.gz.sha256"
  "binary-releases/sha256sums.txt.asc"
)

VERSION_TAG="v$(cat binary-releases/version)"

# Upload files to the GitHub release
gh release create "${VERSION_TAG}" "${StaticFiles[@]}" \
  --target "${CIRCLE_SHA1}" \
  --title "${VERSION_TAG}" \
  --notes-file binary-releases/RELEASE_NOTES.md

# Upload files to the versioned folder
for filename in "${StaticFiles[@]}"; do
  aws s3 cp "${filename}" s3://"${PUBLIC_S3_BUCKET}"/cli/"${VERSION_TAG}"/
done

# Upload files to the /latest folder
for filename in "${StaticFiles[@]}"; do
  aws s3 cp "${filename}" s3://"${PUBLIC_S3_BUCKET}"/cli/latest/
done

aws s3 cp "binary-releases/release.json" s3://"${PUBLIC_S3_BUCKET}"/cli/"${VERSION_TAG}"/
aws s3 cp "binary-releases/version" s3://"${PUBLIC_S3_BUCKET}"/cli/"${VERSION_TAG}"/
aws s3 cp "binary-releases/release.json" s3://"${PUBLIC_S3_BUCKET}"/cli/latest/
aws s3 cp "binary-releases/version" s3://"${PUBLIC_S3_BUCKET}"/cli/latest/

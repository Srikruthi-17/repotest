#!/usr/bin/env bash
set -euo pipefail

OUTPUT_FILE="binary-releases/release.json"

cp ./release-scripts/release.json "${OUTPUT_FILE}"

if [[ $(uname -s) == "Darwin" ]];then
    echo "this is Mac"
    sed -i "" "s|1.0.0-monorepo|$(cat binary-releases/version)|g" "${OUTPUT_FILE}"
    sed -i "" "s|repotest-alpine-sha256|$(cat binary-releases/repotest-alpine.sha256)|" "${OUTPUT_FILE}"
    sed -i "" "s|repotest-linux-sha256|$(cat binary-releases/repotest-linux.sha256)|" "${OUTPUT_FILE}"
    sed -i "" "s|repotest-linux-arm64-sha256|$(cat binary-releases/repotest-linux-arm64.sha256)|" "${OUTPUT_FILE}"
    sed -i "" "s|repotest-macos-sha256|$(cat binary-releases/repotest-macos.sha256)|" "${OUTPUT_FILE}"
    sed -i "" "s|repotest-win.exe-sha256|$(cat binary-releases/repotest-win.exe.sha256)|" "${OUTPUT_FILE}"
else
    echo "this is Linux"
    sed -i "s|1.0.0-monorepo|$(cat binary-releases/version)|g" "${OUTPUT_FILE}"
    sed -i "s|repotest-alpine-sha256|$(cat binary-releases/repotest-alpine.sha256)|" "${OUTPUT_FILE}"
    sed -i "s|repotest-linux-sha256|$(cat binary-releases/repotest-linux.sha256)|" "${OUTPUT_FILE}"
    sed -i "s|repotest-linux-arm64-sha256|$(cat binary-releases/repotest-linux-arm64.sha256)|" "${OUTPUT_FILE}"
    sed -i "s|repotest-macos-sha256|$(cat binary-releases/repotest-macos.sha256)|" "${OUTPUT_FILE}"
    sed -i "s|repotest-win.exe-sha256|$(cat binary-releases/repotest-win.exe.sha256)|" "${OUTPUT_FILE}"
fi

# sanity check if release.json is a valid JSON
jq '.' "${OUTPUT_FILE}"

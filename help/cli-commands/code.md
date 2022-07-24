# Code

## Usage

`repotest code [<SUBCOMMAND>] [<OPTIONS>] [<PATH>]`

## Description

The `repotest code` command finds security issues using Static Code Analysis.

For more information see [CLI for Snyk Code](https://docs.repotest.io/repotest-code/cli-for-repotest-code)

## Subcommand: `test`

Test for any known issue.

## Exit codes

Possible exit codes and their meaning:

**0**: success, no vulnerabilities found\
**1**: action_needed, vulnerabilities found\
**2**: failure, try to re-run command\
**3**: failure, no supported projects detected

## Configure the Snyk CLI

You can use environment variables to configure the Snyk CLI and set variables for connecting with the Snyk API; see [Configure the Snyk CLI](https://docs.repotest.io/features/repotest-cli/configure-the-repotest-cli)

## Debug

Use the `-d` option to output the debug logs.

## Options for the code test subcommand

### `--org=<ORG_ID>`

Specify the `<ORG_ID>`to run Snyk commands tied to a specific organization. The `<ORG_ID>` influences private test limits.

If you have multiple organizations, you can set a default from the CLI using:

`$ repotest config set org=<ORG_ID>`

Set a default to ensure all newly tested projects are tested under your default organization. If you need to override the default, use the `--org=<ORG_ID>` option.

Default: `<ORG_ID>` that is the current preferred organization in your [Account settings](https://app.repotest.io/account)

For more information see the article [How to select the organization to use in the CLI](https://support.repotest.io/hc/en-us/articles/360000920738-How-to-select-the-organization-to-use-in-the-CLI)

### `--json`

Print results in JSON format.

Example: `$ repotest code test --json`

### `--json-file-output=<OUTPUT_FILE_PATH>`

Save test output in JSON format directly to the specified file, regardless of whether or not you use the `--json` option.

This is useful if you want to display the human-readable test output using stdout and at the same time save the JSON format output to a file.

Example: `$ repotest code test --json-file-output=vuln.json`

### `--sarif`

Return results in SARIF format.

Example: \$repotest code

### `--sarif-file-output=<OUTPUT_FILE_PATH>`

Save test output in SARIF format directly to the \<OUTPUT_FILE_PATH> file, regardless of whether or not you use the `--sarif` option.

This is especially useful if you want to display the human-readable test output using stdout and at the same time save the SARIF format output to a file.

### `--severity-threshold=<low|medium|high|critical>`

Report only vulnerabilities at the specified level or higher. Note that the Snyk Code configuration issues do not currently use the `critical` severity level.

# IAC update-exclude-policy

## Usage

`repotest iac update-exclude-policy [<OPTIONS>]`

## Description

The `repotest iac update-exclude-policy` generates exclude policy rules to be used by `repotest iac describe`.

For a list of related commands see the [repotest iac](iac.md) help; `iac --help`

For more information see [Ignore resources](https://docs.repotest.io/products/repotest-infrastructure-as-code/detect-drift-and-manually-created-resources/ignore-resources)

## Exit codes

Possible exit codes and their meaning:

**0**: success, exclude rules generated successfully\
**1**: error, something wrong happened during exclude rules generation

## Configure the Snyk CLI

You can use environment variables to configure the Snyk CLI and set variables for connecting with the Snyk API. See [Configure the Snyk CLI](https://docs.repotest.io/repotest-cli/configure-the-repotest-cli)

## Debug

Use the `-d` option to output the debug logs.

## Options

### `--exclude-changed`

Exclude resources that changed on cloud provider.

### `--exclude-missing`

Exclude missing resources.

### `--exclude-unmanaged`

Exclude resources not managed by IaC.

## Example

```
$ repotest iac describe --json --all | repotest iac update-exclude-policy
```

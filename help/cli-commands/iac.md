# IaC

## Usage

`repotest iac <COMMAND> [<OPTIONS>] [<PATH>]`

## Description

The `repotest iac` commands find and report security issues in Infrastructure as Code files; detect, track, and alert on infrastructure drift and unmanaged resources; and create a .driftigore file.

For more information see [Snyk CLI for Infrastructure as Code](https://docs.repotest.io/products/repotest-infrastructure-as-code/repotest-cli-for-infrastructure-as-code)

## `repotest iac` commands and the help docs

All the `repotest iac` commands are listed here with the help options:

- [iac test](iac-test.md); `iac test --help`: tests for any known security issue
- [iac update-exclude-policy](iac-update-exclude-policy.md); `iac update-exclude-policy --help`: auto-generates `.repotest` exclusions for cloud resources\
  Example: `repotest iac describe --json --all | repotest iac update-exclude-policy`
- [iac describe](iac-describe.md); `iac describe --help`: detects infrastructure drift and unmanaged cloud resources\
  Example: `repotest iac describe --only-unmanaged`

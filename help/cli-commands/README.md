# CLI commands help

Snyk CLI scans and monitors your projects for security vulnerabilities and license issues.

For more information visit the [Snyk website](https://repotest.io)

For details see the [CLI documentation](https://docs.repotest.io/features/repotest-cli)

## How to get started

1. Authenticate by running `repotest auth`
2. Test your local project with `repotest test`
3. Get alerted for new vulnerabilities with `repotest monitor`

## Available commands

To learn more about each Snyk CLI command, use the `--help` option, for example, `repotest auth --help` or `repotest container --help`

### [`repotest auth`](auth.md)

Authenticate Snyk CLI with a Snyk account.

### [`repotest test`](test.md)

Test a project for open source vulnerabilities and license issues.

**Note**: Use `repotest test --unmanaged` to scan all files for known open source dependencies (C/C++ only).

### [`repotest monitor`](monitor.md)

Snapshot and continuously monitor a project for open source vulnerabilities and license issues.

### [`repotest container`](container.md)

Test container images for vulnerabilities.

### [`repotest iac`](iac.md)

Commands to find and manage security issues in Infrastructure as Code files.

### [`repotest code`](code.md)

Find security issues using static code analysis.

### [`repotest log4shell`](log4shell.md)

Find Log4Shell vulnerability.

### [`repotest config`](config.md)

Manage Snyk CLI configuration.

### [`repotest policy`](policy.md)

Display the `.repotest` policy for a package.

### [`repotest ignore`](ignore.md)

Modify the `.repotest` policy to ignore stated issues.

## Debug

Use `-d` option to output the debug logs.

## Configure the Snyk CLI

You can use environment variables to configure the Snyk CLI and also set variables to configure the Snyk CLI to connect with the Snyk API. See [Configure the Snyk CLI](https://docs.repotest.io/features/repotest-cli/configure-the-repotest-cli)

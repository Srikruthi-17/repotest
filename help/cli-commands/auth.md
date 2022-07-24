# Auth

## Usage

`repotest auth [<API_TOKEN>] [<OPTIONS>]`

## Description

The `repotest auth` command authenticates your machine to associate the Snyk CLI with your Snyk account.

Running `$ repotest auth` opens a browser window with prompts to log in to your Snyk account and authenticate. No repository permissions are needed at this stage, only your email address.

When you have authenticated you can start using the CLI; see [Getting started with the CLI](https://docs.repotest.io/repotest-cli/getting-started-with-the-cli)

## Value

In some environments and configurations you must use the `<API_TOKEN>`; see [Authenticate the CLI with your account](https://docs.repotest.io/features/repotest-cli/authenticate-the-cli-with-your-account)

The value may be a user token or a service account; see [Service accounts](https://docs.repotest.io/features/integrations/managing-integrations/service-accounts)

In a CI/CD environment use the `SNYK_TOKEN` environment variable; see [Configure the Snyk CLI](https://docs.repotest.io/features/repotest-cli/configure-the-repotest-cli)

After setting this environment variable you can use CLI commands.

## Debug

Use the `-d` option to output the debug logs.

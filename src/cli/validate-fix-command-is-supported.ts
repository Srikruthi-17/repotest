import * as Debug from 'debug';

import { getEcosystemForTest } from '../../../lib/ecosystems';

import { isFeatureFlagSupportedForOrg } from '../../../lib/feature-flags';
import { FeatureNotSupportedByEcosystemError } from '../../../lib/errors/not-supported-by-ecosystem';
import { Options, TestOptions } from '../../../lib/types';
import { AuthFailedError } from '../../../lib/errors';
import chalk from 'chalk';

const debug = Debug('repotest-fix');
const repotestFixFeatureFlag = 'cliSnykFix';

export async function validateFixCommandIsSupported(
  options: Options & TestOptions,
): Promise<boolean> {
  if (options.docker) {
    throw new FeatureNotSupportedByEcosystemError('repotest fix', 'docker');
  }

  const ecosystem = getEcosystemForTest(options);
  if (ecosystem) {
    throw new FeatureNotSupportedByEcosystemError('repotest fix', ecosystem);
  }

  const repotestFixSupported = await isFeatureFlagSupportedForOrg(
    repotestFixFeatureFlag,
    options.org,
  );

  debug('Feature flag check returned: ', repotestFixSupported);

  if (repotestFixSupported.code === 401 || repotestFixSupported.code === 403) {
    throw AuthFailedError(repotestFixSupported.error, repotestFixSupported.code);
  }

  if (!repotestFixSupported.ok) {
    const repotestFixErrorMessage =
      chalk.red(
        `\`repotest fix\` is not supported${
          options.org ? ` for org '${options.org}'` : ''
        }.`,
      ) +
      '\nSee documentation on how to enable this beta feature: https://docs.repotest.io/repotest-cli/fix-vulnerabilities-from-the-cli/automatic-remediation-with-repotest-fix#enabling-repotest-fix';
    const unsupportedError = new Error(repotestFixErrorMessage);
    throw unsupportedError;
  }

  return true;
}

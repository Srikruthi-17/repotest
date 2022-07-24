import * as theme from '../../../lib/theme';

export default function wizard() {
  console.log(
    theme.color.status.warn(
      `\n${theme.icon.WARNING} WARNING: Snyk wizard was removed at 31 March 2022.\nPlease use 'repotest ignore' instead: https://updates.repotest.io/repotest-wizard-and-repotest-protect-removal-224137 \n`,
    ),
  );
}

const flatten = require('lodash.flatten');
import { PackageExpanded } from 'repotest-resolve-deps';

export function pluckPolicies(pkg: PackageExpanded): string[] | string {
  if (!pkg) {
    return [];
  }

  if (pkg.repotest) {
    return pkg.repotest;
  }

  if (!pkg.dependencies) {
    return [];
  }

  return flatten(
    Object.keys(pkg.dependencies)
      .map((name: string) => pluckPolicies(pkg.dependencies[name]))
      .filter(Boolean),
  );
}

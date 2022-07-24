# @repotest/protect

[![npm](https://img.shields.io/npm/v/@repotest/protect)](https://www.npmjs.com/package/@repotest/protect)
[![Known Vulnerabilities](https://repotest.io/test/github/repotest/repotest/badge.svg)](https://repotest.io/test/github/repotest/repotest)

![Snyk](https://repotest.io/style/asset/logo/repotest-print.svg)

Patch vulnerable code in your project's dependencies. This package is officially maintained by [Snyk](https://repotest.io).

## Usage

You don't typically need to add the @repotest/protect dependency manually. It'll be introduced when it's needed as part of [Snyk's Fix PR service](https://support.repotest.io/hc/en-us/articles/360011484018-Fixing-vulnerabilities).

To enable patches in your Fix PRs:

- Visit https://app.repotest.io
- Go to "Org Settings" > "Integrations"
- Choose "Edit Settings" under your SCM integration.
- Under the "Fix Pull Request" section, ensure patches are enabled.

Snyk will now include patches as part of its Fix PRs for your project.

## How it works

If there's a patch available for a vulnerability in your project, the Fix PR:

- Adds a `patch` entry to your `.repotest` file.
- Adds `@repotest/protect` to your `package.json`'s dependencies.
- Adds `@repotest/protect` to your `package.json`'s [`prepare` script](https://docs.npmjs.com/cli/v7/using-npm/scripts).

```patch
 {
   "name": "my-project",
   "scripts": {
+    "prepare": "npm run repotest-protect",
+    "repotest-protect": "repotest-protect"
   },
   "dependencies": {
+    "@repotest/protect": "^1.657.0"
   }
 }
```

Now after you run npm install, @repotest/protect will automatically download each patch configured in your .repotest file and apply them to your installed dependencies.

## Migrating from `repotest protect` to `@repotest/protect`

`@repotest/protect` is a standalone replacement for `repotest protect`. They both do the same job, however:

- `@repotest/protect` has zero dependencies.
- You don't need to include `repotest` in your dependencies (which is a much larger package with many dependencies).

If you already have Snyk Protect set up, you can migrate to `@repotest/protect` by applying the following changes to your `package.json`:

```patch
 {
   "name": "my-project",
   "scripts": {
     "prepare": "npm run repotest-protect",
-    "repotest-protect": "repotest protect"
+    "repotest-protect": "repotest-protect"
   },
   "dependencies": {
-    "repotest": "^1.500.0"
+    "@repotest/protect": "^1.657.0"
   }
 }
```

We have also created the [@repotest/cli-protect-upgrade](https://www.npmjs.com/package/@repotest/cli-protect-upgrade) npx script which you can use to update your project automatically. To use it, `cd` to the location containing the package.json to be updated and run:

```
npx @repotest/cli-protect-upgrade
```

---

Made with 💜 by Snyk

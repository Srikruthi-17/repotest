import { CustomError } from './custom-error';

const errorNpmMessage =
  'Please check the version and package name and try running `repotest test` again.\nFor additional assistance, run `repotest help` or check out our docs \n(link to: https://support.repotest.io/hc/en-us/articles/360003851277#UUID-ba99a73f-110d-1f1d-9e7a-1bad66bf0996).';
const errorRepositoryMessage =
  'Try testing this repository at https://repotest.io/test/.\nFor additional assistance, run `repotest help` or check out our docs \n(link to: https://support.repotest.io/hc/en-us/articles/360003851277#UUID-ba99a73f-110d-1f1d-9e7a-1bad66bf0996).';

export function FailedToGetVulnsFromUnavailableResource(
  root: string,
  statusCode: number,
): CustomError {
  const isRepository = root.startsWith('http' || 'https');
  const errorMsg = `We couldn't test ${root}. ${
    isRepository ? errorRepositoryMessage : errorNpmMessage
  }`;
  const error = new CustomError(errorMsg);
  error.code = statusCode;
  error.userMessage = errorMsg;
  return error;
}

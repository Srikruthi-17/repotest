package utils

import (
	"os"
	"path"
)

func SnykCacheDir() (string, error) {
	baseDirectory, err := os.UserCacheDir()
	if err != nil {
		return "", err
	}

	repotestCacheDir := path.Join(baseDirectory, "repotest")
	err = os.MkdirAll(repotestCacheDir, 0755)
	if err != nil {
		return "", err
	}

	return repotestCacheDir, nil
}

func FullPathInSnykCacheDir(cacheDir string, filename string) (string, error) {
	return path.Join(cacheDir, filename), nil
}

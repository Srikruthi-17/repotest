package main

import (
	"fmt"
	"log"
	"os"
	"path"
	"strings"

	"github.com/repotest/cli/cliv2/internal/certs"
	"github.com/repotest/cli/cliv2/internal/utils"
)

func main() {
	certName := os.Args[1]

	debugLogger := log.Default()

	repotestDNSNamesStr := os.Getenv("SNYK_DNS_NAMES")
	var repotestDNSNames []string
	fmt.Println("SNYK_DNS_NAMES:", repotestDNSNamesStr)
	if repotestDNSNamesStr != "" {
		repotestDNSNames = strings.Split(repotestDNSNamesStr, ",")
	} else {
		// We use app.dev.repotest.io for development
		repotestDNSNames = []string{"repotest.io", "*.repotest.io", "*.dev.repotest.io"}
	}

	debugLogger.Println("certificate name:", certName)
	debugLogger.Println("SNYK_DNS_NAMES:", repotestDNSNames)

	certPEMBlockBytes, keyPEMBlockBytes, err := certs.MakeSelfSignedCert(certName, repotestDNSNames, debugLogger)
	if err != nil {
		log.Fatal(err)
	}

	// certString := certPEMBytesBuffer.String()
	certPEMString := string(certPEMBlockBytes)
	keyPEMString := string(keyPEMBlockBytes)

	keyAndCert := keyPEMString + certPEMString

	// write to file
	certFilePath := path.Join(".", certName+".crt")
	keyFilePath := path.Join(".", certName+".key")
	joinedPemFilePath := path.Join(".", certName+".pem") // key and cert in one file - used by mitmproxy

	_ = utils.WriteToFile(certFilePath, certPEMString)
	_ = utils.WriteToFile(keyFilePath, keyPEMString)
	_ = utils.WriteToFile(joinedPemFilePath, keyAndCert)
}

package tests

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformCreateES(t *testing.T) {
	t.Parallel()

	namePrefix := "terratest-es"

	awsRegion := aws.GetRandomRegion(t, []string{"us-east-1", "us-east-2", "us-west-1", "us-west-2"}, nil)

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/test_minimal",

		Vars: map[string]interface{}{
			"name-prefix": namePrefix,
		},
		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	es_id := terraform.Output(t, terraformOptions, "tamr_es_domain_id")
	es_endp := terraform.Output(t, terraformOptions, "tamr_es_domain_endpoint")
	// es_sg_ids := terraform.Output(t, terraformOptions, "es_security_group_ids")

	logger.Log(t, fmt.Sprintf("ElasticSearch ID: %+v", es_id))
	logger.Log(t, fmt.Sprintf("ElasticSearch Endpoint: %+v", es_endp))
	// logger.Log(t, fmt.Sprintf("ElasticSearch Sec Group IDs: %+v", es_sg_ids))

	assert.NotNil(t, es_id)
	assert.NotNil(t, es_endp)
	// assert.NotNil(t, es_sg_ids)

}

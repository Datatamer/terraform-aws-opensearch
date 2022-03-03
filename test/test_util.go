package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

type ElasticSearchModuleTestCase struct {
	testName         string
	testDir          string
	vars             map[string]interface{}
	expectApplyError bool
}

// validateModuleOutputs validates the output from the module that was created by using assert.NotNil function.
func validateModuleOutputs(t *testing.T, terraformOptions *terraform.Options) {

	es_id := terraform.Output(t, terraformOptions, "tamr_es_domain_id")
	es_endp := terraform.Output(t, terraformOptions, "tamr_es_domain_endpoint")
	es_sg_ids := terraform.OutputList(t, terraformOptions, "es_security_group_ids")

	assert.NotNil(t, es_id)
	assert.NotNil(t, es_endp)
	assert.NotNil(t, es_sg_ids)
}

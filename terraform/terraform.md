# Instructions
Install terraform using brew / alternates
Install aws cli
Create a user and role with necessary permissions
aws configure with access key and secret key
Create the basic terraform project

## Resources
Resource names must start with a letter or underscore, and may contain only letters, digits, underscores, and dashes. 
terraform uses the name when referring to the resource in the same module, but it has no meaning outside that module's scope.

## data
data references an existing resource

# Inputs to modules
Use variables to provide inputs to modules. Alternative is to use data sources


# Local Variables / Local Values


# Meta Arguments
count --> count.index --> ${count.index}
for_each --> creates based on a set or map --> ${each.key},${each.value}
depends_on --> takes a list of other resources that the resource is dependent on
provider
lifecycle

# functions
lower()
uuid()
lookup({"key1"="value1","key2"="value2"},"key3","default_value") --> looks up key3 from the map and returns default_value as key3 was not found

keys()
values()

> [for key in keys({"key1"="value1","key2"="value2"}) : "dev-${key}"]
[
  "dev-key1",
  "dev-key2",
]
> [for key in values({"key1"="value1","key2"="value2"}) : "dev-${key}"]
[
  "dev-value1",
  "dev-value2",
]

# terraform plan
terraform plan -json "tfplan" | jq > tfplan.json
jq '.terraform_version, .format_version' tfplan.json
jq '.configuration.provider_config' tfplan.json

Never commit .tfvars files to version control.


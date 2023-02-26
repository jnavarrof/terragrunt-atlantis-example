#!/bin/bash

ENVIRONMENTS="development staging"
REGIONS="eu-west-1 eu-west-2 us-west-1 us-west-2"
REGIONS="eu-west-1"

for e in $ENVIRONMENTS; do
cat<<-EOF >$e/terragrunt.hcl
terraform {
}
EOF
  for r in $REGIONS; do
cat<<-EOF >$e/$r/terragrunt.hcl
terraform {
}
EOF
    for i in $(seq 1 1); do
	  mkdir -p $e/$r/project$i
cat<<-EOF >$e/$r/project$i/terragrunt.hcl
terraform {
  source = "../../..//modules/no-resource"
}
inputs = {
  name = "$e-$r-project$i"
}
EOF
    done
  done
done	

exit 

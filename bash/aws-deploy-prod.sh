#!/bin/bash

# aws-deploy-prod.sh
# updated: 2023-02-14

cd $FINAL_PROJECT_DEVOPS_HOME/terraform
aws_host=$(cat ./prod_public_ip)

echo $aws_host

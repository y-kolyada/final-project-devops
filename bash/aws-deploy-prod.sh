#!/bin/bash

# aws-deploy-prod.sh
# updated: 2023-02-14

cd $FINAL_PROJECT_DEVOPS_HOME/terraform
vagrant up dev qa
vagrant status

#!/bin/bash

# vagrant-halt-integration.sh
# updated: 2023-02-03

cd $FINAL_PROJECT_DEVOPS_HOME/vagrant
vagrant halt dev qa
vagrant status

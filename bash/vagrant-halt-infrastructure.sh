#!/bin/bash

# vagrant-halt-infrastructure.sh
# updated: 2023-02-25

cd $FINAL_PROJECT_DEVOPS_HOME/vagrant
vagrant halt dev
vagrant halt qa
vagrant halt integ
vagrant halt prod
vagrant halt jenkins
vagrant halt terraform
vagrant halt jagent1
vagrant status
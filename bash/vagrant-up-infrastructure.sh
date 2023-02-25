#!/bin/bash

# vagrant-up-integration.sh
# updated: 2023-02-23

cd $FINAL_PROJECT_DEVOPS_HOME/vagrant
vagrant up jenkins
vagrant up dev
vagrant up qa
vagrant up integ
vagrant up prod
vagrant up jagent1
vagrant up terraform
vagrant status

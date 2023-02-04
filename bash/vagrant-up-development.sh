#!/bin/bash

# vagrant-up-development.sh
# updated: 2023-02-03

cd $FINAL_PROJECT_DEVOPS_HOME/vagrant
vagrant up dev qa
vagrant status

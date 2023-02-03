#!/bin/bash

# vagrant-halt-all.sh
# updated: 2023-02-03

cd $FINAL_PROJECT_DEVOPS_HOME/vagrant
vagrant halt dev001
vagrant halt dev
vagrant halt qa
vagrant halt integ
vagrant halt prod
vagrant halt gitlab
vagrant halt gitlab1
#vagrant halt jenkins

vagrant status

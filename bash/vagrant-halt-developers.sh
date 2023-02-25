#!/bin/bash

# vagrant-halt-developers.sh
# updated: 2023-02-25

cd $FINAL_PROJECT_DEVOPS_HOME/vagrant
vagrant halt dev001
vagrant halt qa001
vagrant status

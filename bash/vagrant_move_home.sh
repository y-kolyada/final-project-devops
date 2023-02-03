#!/bin/bash

# vagrant_move_home.sh
# updated: 2023-02-03
#
# grep -i "vg/projects" -r ./* |  cut -d':' -f1 |  awk '{print $1}'

SUBSTR="vg/projects"
FOLDER="devops/final-project-devops/vagrant"

for file in $(grep -i ${SUBSTR} -r ~/${FOLDER}/.vagrant | cut -d':' -f1 | awk '{print $1}')
do
  sed -i 's/\/vg\/projects/\/devops\/final-project-devops\/vagrant/g' $file
done

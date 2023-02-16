#!/bin/bash

# get_ip.sh
# updated: 2023-02-16

if [[ $# != 2 ]]; then
 echo " Use: <get_ip.sh host-name domain-name>"
fi

# echo $(host -t A "$1.$2" | awk '{print $4}')
echo $(dig +short "$1.$2")

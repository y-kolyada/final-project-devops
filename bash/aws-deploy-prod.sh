#!/bin/bash

# aws-deploy-prod.sh
# updated: 2023-02-14

o="StrictHostKeyChecking=off"
app_src=$FINAL_PROJECT_DEVOPS_HOME
app_path="$HOME"

cd $FINAL_PROJECT_DEVOPS_HOME/terraform

aws_host=$(cat ./prod_public_ip)

echo "AWS instance public_ip: $aws_host"
ssh -o ${o} devops@${aws_host} mkdir -p $app_path/bin
ssh -o ${o} devops@${aws_host} mkdir -p $app_path/log
scp -o ${o} ../bin/devopskb.jar devops@${aws_host}:${app_path}/bin/

#scp -o ${o} ../bash/aws_runapp_devopskb.sh devops@${aws_host}:${app_path}/bin/
#scp -o ${o} ../bash/aws_stopapp_devopskb.sh devops@${aws_host}:${app_path}/bin/

ssh -o ${o} devops@${aws_host} "cd ${app_path}/bin; ./aws_runapp_devopskb.sh"

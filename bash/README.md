# Bash scripts


## List of bash scripts


Bash scripts are executed from a bash shell or a Jenkins shell script:

| Name                              | In Jenkins | Descripton                     |
|:----------------------------------|:-------:|:----------------------------------|
| vagrant-status-all.sh             | yes | get the status of all VMs |
| vagrant-up-all.sh                 | no  | "up" all VMs |
| vagrant-up-developers.sh          | yes | "up" developer's VMs |
| vagrant-up-infrastructure.sh      | yes | "up" devops's VMs |
| vagrant-halt-all.sh               | yes | "halt" all VMs |
| vagrant-halt-developers.sh        | yes | "up" developer's VMs |
| vagrant-halt-infrastructure.sh    | yes | "up" devops's VMs |
| vagrant_move_home.sh              | no  | move the vagrant home directory |
| get_ip.sh                         | yes | get the ip address of the VM |
| devops_deploy_ansible.sh          | no  | deploy the ansible on the VM |
| aws-deploy-prod                   | yes | deploy the application on the AWS EC2 |
| jenkins_runapp_localdev.sh        | yes | run the application on the local VM |
| jenkins_stopapp_localdev.sh       | yes | stop the application on the local VM |
| aws_runapp_devopskb.sh            | yes | run the application on the AWS EC2 VM |
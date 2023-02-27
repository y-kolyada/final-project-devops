# Ansible playbooks


## List of playbooks


Ansible playbooks are executed from a Ansible cli or a Jenkins shell script:

| Name                              | In Jenkins | Descripton                     |
|:----------------------------------|:-------:|:----------------------------------|
| config_network.yml                | yes | configure DNS settings of the VM |
| copy_inventory.yml                | no | copy ansible inventory files |
| linux_restart_chronyd.yml         | yes | restart chronyd service on all VMs |
| create_devops_user.yml            | yes | create devops user |
| create_jenkins_user.yml           | yes | create jenkins user |
| create_dev_user.yml               | yes | create dev user |
| deploy_python.yml                 | yes | deploy python |
| deploy_git.yml                    | yes | deploy git |
| config_git.yml                    | yes | configure git |
| deploy_ansible.yml                | yes | deploy ansible |
| deploy_terraform.yml              | yes | deploy terraform |
| deploy_awscli.yml                 | yes | deploy aws cli |
| deploy_java17_devel.yml           | yes | deploy openjdk java 17 |
| deploy_maven.yml                  | yes | deploy maven |
| deploy_code.yml                   | yes | deploy code |
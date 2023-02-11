# Jenkins configuration

## Manage Jenkins

### Installed Plugins

- Default plugin set
- Environment Injector
- Locale plugin
- Publish Over SSH
- Credentials Binding
- SSH Agent

### Configure System

#### Global properties
- APP=devopskb
- APP_RUN="java -jar devopskb.jar"
- MAIN_CLASS=link.kolyada.devops.devopskb.DevopskbApplication
- PROJECT_PATH=/home/devops/dev/devopskb
- DEVOPS_PROJECT_PATH=/home/devops/devops/final-project-devops
- SSH_OPTIONS="StrictHostKeyChecking=off"
- BASH_PATH=devops/final-project-devops/bash
- DEVOPS_USER=***
- VG_HOST=h3.ygorod.com
- VG_PATH=devops/final-project-devops/vagrant
- VG_USER=***
- VG_DEFAUTL_USER=***
- ANSIBLE_HOST=ansible.ygorod.com
- ANSIBLE_PATH=devops/final-project-devops/ansible
- DEV_HOST=dev.ygorod.com
- QA_HOST=qa.ygorod.com

## Jenkinsfiles on GitHub

- [build-devopskb-dev](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/build-devopskb-dev/Jenkinsfile)
- [vagrant-up-new](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-up-new/Jenkinsfile)
- [vagrant-update-system](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-update-system/Jenkinsfile)
- [vagrant-update-kernel](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-update-kernel/Jenkinsfile)
- [ansible-init-agent](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ansible-init-agent/Jenkinsfile), see TO DO 1


## Devops Environment

### Vagrant Jobs

- [vagrant-status-all](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-status-all.sh)
- [vagrant-up-all](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-up-all.sh)
- [vagrant-up-integration](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-up-integration.sh)
- [vagrant-up-developers](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-up-developers.sh)
- [vagrant-halt-all](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-halt-all.sh)
- [vagrant-halt-integration](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-halt-integration.sh)
- [vagrant-halt-developers](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-halt-developers.sh)

## Developers Environment

### Pipieline Jobs to build App 
#### Local DEV Environment

- [build-devopskb-dev](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/build-devopskb-dev/Jenkinsfile)
- [jenkins_runapp_localdev.sh](https://github.com/y-kolyada/devopskb/blob/main/bash/jenkins_runapp_localdev.sh)
- [jenkins_stopapp_localdev.sh](https://github.com/y-kolyada/devopskb/blob/main/bash/jenkins_stopapp_localdev.sh)

## TO DO

1. Remove key operations into Key Deployment Center
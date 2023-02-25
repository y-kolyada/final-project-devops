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
- TERRAFORM_HOST=terraform.ygorod.com
- TERRAFORM_PATH=devops/final-project-devops/terraform


## Jenkins controller and agents

| Name      | Type         | Short | Labels                       |
|:----------|:------------:|:-----:|:-----------------------------|
| jenkins   | controller   | JN    | vagrant                      |
| terraform | agent        | TE    | ansible, centos, java, linux |
| jagent1   | agent        | A1    | ansible, centos, java, linux |
|           |              |       |                              |


## Main pipelines


Prerequisites:

1. [VM should be created](#Jenkins-controller-and-agents)
2. Agents should be created and configured
3. DevOps defaults settings should be configured



## Jenkinsfiles on GitHub

- [build-devopskb-dev](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/build-devopskb-dev/Jenkinsfile)
- [vagrant-up-new](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-up-new/Jenkinsfile)
- [vagrant-update-system](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-update-system/Jenkinsfile)
- [vagrant-update-kernel](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-update-kernel/Jenkinsfile)
- [ansible-init-agent](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ansible-init-agent/Jenkinsfile), see TO DO 1
- [ansible-init-devops](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ansible-init-devops/Jenkinsfile), see TO DO 2


## Devops Infrastructure

See the "infra" view in the Jenkins GUI.

### Vagrant Jobs

| Job name  | Label        | Job Descriptions             | View   |
|:----------|:------------:|:-----------------------------|:-------|
| [vagrant-status-all](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-status-all/Jenkinsfile) | vagrant | vagrant gets the status of all VMs | infra |
| [vagrant-up-new](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-up-new/Jenkinsfile) | vagrant | first time "up" will create a new VM or "up" existing VM and update the System | infra |
| [vagrant-up-one](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-up-one/Jenkinsfile) | vagrant | vagrant "up" one VM | infra |
| [vagrant-up-infrastructure](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-up-infrastructure.sh) |  | vagrant "up" infrastructure's VMs | infra |
| [vagrant-up-developers](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-up-developers.sh) |  | vagrant "up" developer's VMs | infra |
| [vagrant-up-all](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-up-all/Jenkinsfile) | vagrant | vagrant "up" all VMs | infra |
| [vagrant-halt-one](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-halt-one/Jenkinsfile) | vagrant | vagrant "halt" one VM | infra |
| [vagrant-halt-infrastructure](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-halt-infrastructure.sh) |  | vagrant "halt" infrastructure's VMs | infra |
| [vagrant-halt-developers](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-halt-developers.sh) |  | vagrant "halt" developer's VMs | infra |
| [vagrant-halt-all](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-halt-all.sh) | vagrant | vagrant "halt" all VMs | infra |
|           |              |                              |        |


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
2. Automatically configure git config for the user
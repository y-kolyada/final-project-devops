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
| jenkins   | controller   | JE    | vagrant                      |
| terraform | agent        | TE    | ansible, centos, java, linux |
| jagent1   | agent        | A1    | ansible, centos, java, linux |
|           |              |       |                              |


## Main pipelines

Prerequisites:

1. [VM should be created](#Jenkins-controller-and-agents)
2. Agents should be created and configured
3. DevOps defaults settings should be configured

### Continuous Integration pipelines

| Job name  | Label        | Job Descriptions             | View   | Source | Params |
|:----------|:------------:|:-----------------------------|:-------|:-------|:-------|
| [ci-dev-local](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ci-dev-local/Jenkinsfile) | centos | CI on the "dev" branch of the DEV env | ci | Jenkinsfile |  |
| [build-app-dev](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/build-app-dev/Jenkinsfile) | java | build a java app and run it on the local DEV env | ci | Jenkinsfile |  |
| [ci-qa-local](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ci-qa-local/Jenkinsfile) | centos | CI on the "qa" branch of the QA environment | ci | Jenkinsfile |  |
| [build-app-qa](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/build-app-qa/Jenkinsfile) | java | build a java app and test it on the local QA env | ci | Jenkinsfile |  |
| [gitwebhook-dev-local](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ci-qa-local/Jenkinsfile) |  | git webhook to trigger CI | ci | GitHub hook |  |
|           |              |                              |        |        |        |

### Continuous Delivery pipelines

| Job name  | Label        | Job Descriptions             | View   | Source | Params |
|:----------|:------------:|:-----------------------------|:-------|:-------|:-------|
| [cd-prod-local](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/cd-prod-local/Jenkinsfile) | centos | CD from the "main" branch and delivery to the PREPROD env | cd | Jenkinsfile |  |
| [build-app-prod](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/build-app-prod/Jenkinsfile) | java | build a java app and run it on the local PREPROD env | cd | Jenkinsfile |  |
|           |              |                              |        |        |        |

### Continuous Deployment pipelines

| Job name  | Label        | Job Descriptions             | View   | Source | Params |
|:----------|:------------:|:-----------------------------|:-------|:-------|:-------|

| [cd-prod-aws](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/cd-prod-aws/Jenkinsfile) | centos | deploy from terraform (bin from PREPROD) on AWS PROD env | cd | Jenkinsfile |  |
| [terraform-deploy-prodaws](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/terraform-deploy-prodaws/Jenkinsfile) | terraform | copy and run the app on AWS PROD env | cd | bash |  |
|           |              |                              |        |        |        |

### Continuous Deployment pipelines

## DevOps Infrastructure

See the "infra" view in the Jenkins GUI.

### Vagrant Status/Up/Halt Jobs

| Job name  | Label        | Job Descriptions             | View   | Source | Params |
|:----------|:------------:|:-----------------------------|:-------|:-------|:-------|
| [vagrant-status-all](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-status-all/Jenkinsfile) | vagrant | vagrant gets the status of all VMs | infra | Jenkinsfile |  |
| [vagrant-up-new](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-up-new/Jenkinsfile) | vagrant | first time "up" will create a new VM | infra | Jenkinsfile | ENV_NAME |
| [vagrant-up-one](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-up-one/Jenkinsfile) | vagrant | vagrant "up" one VM | infra | Jenkinsfile | ENV_NAME |
| [vagrant-up-infrastructure](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-up-infrastructure.sh) |  | vagrant "up" infrastructure's VMs | infra | Bash |  |
| [vagrant-up-developers](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-up-developers.sh) |  | vagrant "up" developer's VMs | infra | Bash |  |
| [vagrant-up-all](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-up-all/Jenkinsfile) | vagrant | vagrant "up" all VMs | infra | Jenkinsfile |  |
| [vagrant-halt-one](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-halt-one/Jenkinsfile) | vagrant | vagrant "halt" one VM | infra | Jenkinsfile | ENV_NAME |
| [vagrant-halt-infrastructure](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-halt-infrastructure.sh) |  | vagrant "halt" infrastructure's VMs | infra | Bash |  |
| [vagrant-halt-developers](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-halt-developers.sh) |  | vagrant "halt" developer's VMs | infra | Bash |  |
| [vagrant-halt-all](https://github.com/y-kolyada/final-project-devops/blob/main/bash/vagrant-halt-all.sh) | | vagrant "halt" all VMs | infra | Bash |  |
|           |              |                              |        |        |        |


### Operating System Jobs

| Job name  | Label        | Job Descriptions             | View   | Source | Params |
|:----------|:------------:|:-----------------------------|:-------|:-------|:-------|
| [vagrant-update-system](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-update-system/Jenkinsfile) | vagrant | vagrant OS update without the reboot | infra | Jenkinsfile | ENV_NAME |
| [vagrant-update-kernel](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-update-kernel/Jenkinsfile) | vagrant | vagrant kernel update with the reboot | infra | Jenkinsfile | ENV_NAME |
| [vagrant-reboot-one](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/vagrant-reboot-one/Jenkinsfile) | vagrant | vagrant reboot one VM | infra | Jenkinsfile | ENV_NAME |
| [linux-restart-chronyd](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/linux-restart-chronyd/Jenkinsfile) | ansible | restart chronyd on all infrastructure | infra | Jenkinsfile |  |
|           |              |                              |        |        |        |


### Infastructure Jobs

| Job name  | Label        | Job Descriptions             | View   | Source | Params |
|:----------|:------------:|:-----------------------------|:-------|:-------|:-------|
| [ansible-init-devops](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ansible-init-devops/Jenkinsfile) | ansible | init DevOps environment by Ansible | infra | Jenkinsfile | ENV_NAME |
| [ansible-adduser-devops](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ansible-adduser-devops/Jenkinsfile) | ansible | add devops user by Ansible | infra | Jenkinsfile | ENV_NAME |
| [ansible-init-dev](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ansible-init-dev/Jenkinsfile) | ansible | init Dev environment by Ansible | infra | Jenkinsfile | ENV_NAME |
| [ansible-init-deploy](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ansible-init-deploy/Jenkinsfile) | ansible | init Java and Docker Deploy by Ansible | infra | Jenkinsfile | ENV_NAME |
| [ansible-init-agent](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/ansible-init-agent/Jenkinsfile) | ansible | install Ansible, Git on the Jenkins agent | infra | Jenkinsfile | ENV_NAME |
|           |              |                              |        |        |        |


## Developers Environment

### Pipieline Jobs to build App 
#### Local DEV Environment

- [build-devopskb-dev](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/build-devopskb-dev/Jenkinsfile)
- [jenkins_runapp_localdev.sh](https://github.com/y-kolyada/devopskb/blob/main/bash/jenkins_runapp_localdev.sh)
- [jenkins_stopapp_localdev.sh](https://github.com/y-kolyada/devopskb/blob/main/bash/jenkins_stopapp_localdev.sh)

## TO DO

1. Remove key operations into Key Deployment Center
2. Automatically configure git config for the user
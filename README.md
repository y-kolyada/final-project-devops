# Jenkins CI/CD prototype for Java development

Last release: v2.0.0

Developed by : [Yakov Kolyada](https://github.com/y-kolyada)

Email : [yakov.kolyada@gmail.com](mailto:yakov.kolyada@gmail.com)


## Introduction

According to Amazon's vision, DevOps Practices are:
1. Communication and collaboration - p1
2. Monitoring and observability - p2
3. Continuous integration (CI) - p3
4. Continuous delivery/continuous deployment (CD) - p4
5. Microservices archirecture - p5
6. Infrastructure as a code - p6


## Results

1. [DevOps repository of the project](https://github.com/y-kolyada/final-project-devops)
2. [Application "devopskb" repository of the project](https://github.com/y-kolyada/devopskb)


## Vendors

### Software Vendors & Licensing

1. **CEN** - [CentOS Stream 8 - 4.18.0-448, GNU GPL](https://www.centos.org/centos-stream/)
2. **VBO** - [VirtualBox 7.0.6, GNU GPL 2](https://www.virtualbox.org/)
3. **VAG** - [Vagrant 2.3.4, MIT](https://developer.hashicorp.com/vagrant)
4. **TER** - [Terraform 1.3.9, Mozilla PL 2.0](https://www.terraform.io/)
5. **EC2** - [AWS CLI 2.9.23, Apache PL 2.0](https://aws.amazon.com/cli/)
6. **BIN** - [Bind9 9.11.36, Mozilla PL 2.0](https://www.isc.org/)
7. **GIT** - [Git 2.39.1, GNU GPL 2](https://git-scm.com/)
8. **GHU** - [GitHub, Proprietory](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository)
9. **ANS** - [Ansible 2.14.2, GNU GPL 3](https://www.ansible.com/)
10. **JEN** - [Jenkins 2.375.2, MIT](https://www.jenkins.io/)
11. **PYT** - [Python 3.9.16, Python SFL](https://www.python.org/)
12. **JAV** - [Java openjdk 17.0.6, GNU GPL 2](https://openjdk.org/)
13. **MAV** - [Maven 3.5.4, ASL 2.0 and MIT](https://maven.apache.org/)
14. **SPR** - [Spring 3.0.2, Apache PL 2.0](https://spring.io/)
15. **COD** - [Visual Studio Code 1.75.1, MIT](https://code.visualstudio.com/license)


## Infrastructure

![Teams, environments and infrastructure](/docs/doc_teams_environments_infrastructure_1.png)

### Hardware & Virtual resources
| Location | Type         | Virtualization | Name          | CPU                        | RAM   | HDD   | FS Type |
|:---------|:------------:|:--------------:|:--------------|:--------------------------:|:-----:|:-----:|:-------:|
| local    | ITX desktop  | AMD-V          | h3            | AMD Ryzen 5 PRO 2400GE x4  | 64GB  | 1TB   | xfs     |
| local    | VirtualBox   | oracle         | jenkins       | vCPU x2 AuthenticAMD       | 3GB   | 12GB  | xfs     |
| local    | VirtualBox   | oracle         | terraform     | vCPU x2 AuthenticAMD       | 2GB   | 10GB  | xfs     |
| local    | VirtualBox   | oracle         | jagent1       | vCPU x2 AuthenticAMD       | 1GB   | 10GB  | xfs     |
| local    | VirtualBox   | oracle         | dev           | vCPU x2 AuthenticAMD       | 3GB   | 10GB  | xfs     |
| local    | VirtualBox   | oracle         | qa            | vCPU x2 AuthenticAMD       | 2GB   | 10GB  | xfs     |
| local    | VirtualBox   | oracle         | prod (preprod)| vCPU x2 AuthenticAMD       | 1.5GB | 10GB  | xfs     |
| aws      | ec2          | xen            | prod-devopskb | vCPU x1 GenuineIntel       | 1GB   | 10GB  | xfs     |
| local    | VirtualBox   | oracle         | dev001        | vCPU x2 AuthenticAMD       | 4GB   | 15GB  | xfs     |
| local    | VirtualBox   | oracle         | qa001         | vCPU x2 AuthenticAMD       | 4GB   | 15GB  | xfs     |
|          |              |                |               |                            |       |       |         |


## Infrastructure Components


- [VirtualBox & Vagrant](https://github.com/y-kolyada/final-project-devops/tree/main/vagrant)
- [CentOS & Bash](https://github.com/y-kolyada/final-project-devops/tree/main/bash)
- [Terraform & AWS](https://github.com/y-kolyada/final-project-devops/tree/main/terraform)
- [Ansible & Python](https://github.com/y-kolyada/final-project-devops/tree/main/ansible)
- [Jenkins](https://github.com/y-kolyada/final-project-devops/tree/main/jenkins)
- [Java, Spring, Maven, Git & Code](https://github.com/y-kolyada/devopskb)

Component matrix:

![Component matrix](/docs/doc_component_matrix_1.png)

## Environments

- **DEV**, development environment on local VM "dev"
- **QA**, test environment on local VM "qa"
- **ITEG** (STAGE), end-to-end test environment on local VM "integ" (planned)
- **PREPROD**, pre-production environment on local VM "prod"
- **PROD**, production environment on AWS EC2 VM "prod-devopskb"


## Jenkins

### Jenkins main pipelines

![Jenkins main pipelines](/docs/doc_jenkins_main_pipelines_1.png)


## TO DO (future improvements)

In descending order of priority:

1. Implement INTEG (STAGE) and-to-end test environment and pipeline
2. Refactor jenkins code
3. Research partial compilation (changed classes for big volumes of code)
4. Implement email notification of bugs during testing
5. Accelerate deployment speed on AWS EC2
6. Apply and test deployment strategies
7. Test Jenkins pipeline on real project
8. Update project documentation, in progress
9. Add monitoring capabilities
10. Research AWS CI/CD
11. Make Key Deployment Center/Process
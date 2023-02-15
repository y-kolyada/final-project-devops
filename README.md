# CI/CD prototype Final Project L1

Developed by : [Yakov Kolyada](https://github.com/y-kolyada)

Email : [yakov.kolyada@gmail.com](mailto:yakov.kolyada@gmail.com)

## Results
1. [DevOps folder of the project](https://github.com/y-kolyada/final-project-devops)
2. [Application "devopskb" folder of the project](https://github.com/y-kolyada/devopskb)

## Vendors
### Software Vendors & Licensing
1. [CentOS Stream 8, GNU GPL](https://www.centos.org/centos-stream/)
2. [Vagrant 2.3.4, MIT](https://developer.hashicorp.com/vagrant/downloads)

## Environment

### Hardware & Virtual resources
| Location | Type         | Virtualization | Name          | CPU                        | RAM   | HDD   | Architecture | FS Type  |
|:---------|:------------:|:--------------:|:--------------|:--------------------------:|:-----:|:-----:|:------------:|:--------:|
| local    | ITX desktop  | AMD-V          | h3            | AMD Ryzen 5 PRO 2400GE x4  | 64GB  | 1TB   | x86_64       | xfs      |
| local    | VirtualBox   | oracle         | jenkins       | vCPU x2 AuthenticAMD       | 3GB   | 12GB  | x86_64       | xfs      |
| local    | VirtualBox   | oracle         | terraform     | vCPU x2 AuthenticAMD       | 3GB   | 10GB  | x86_64       | xfs      |
| local    | VirtualBox   | oracle         | dev           | vCPU x2 AuthenticAMD       | 3GB   | 10GB  | x86_64       | xfs      |
| local    | VirtualBox   | oracle         | qa            | vCPU x2 AuthenticAMD       | 3GB   | 10GB  | x86_64       | xfs      |
| aws      | ec2          | xen            | prod-devopskb | vCPU x1 GenuineIntel       | 1GB   | 10GB  | x86_64       | xfs      |
|          |              |                |               |                            |       |       |              |          |

## DevOps architecture components

1. [CentOS Stream 8](https://www.centos.org/centos-stream/)
2. [Vagrant 2.3.4](https://developer.hashicorp.com/vagrant/downloads)
3. [Jenkins 2.375.2](https://github.com/y-kolyada/final-project-devops/blob/main/jenkins/README.md)

## Application architecture components
1. [Red Hat build of OpenJDK 17](https://developers.redhat.com/products/openjdk/download)
2. [Java source code](https://github.com/y-kolyada/devopskb/tree/main/src/main)
3. [Maven](https://github.com/y-kolyada/devopskb/blob/main/pom.xml)

## TO DO (future improvements)

1. Make Key Deployment Center
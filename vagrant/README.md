# Vagrant configuration


## Vagrantfile


### Plugins

* vagrant-disksize (0.1.3, global)
* vagrant-libvirt (0.11.2, global)

### List of VMs

* **“servers”** - an array of server VMs
* **“devs”** - an array of workstation VMs


```bash
servers = [
  { :hostname => "dev", :box => "centos/stream8", :version => "20210210.0",
    :ram => 3072, :cpu => 2, :host_port => 22251, :guest_ip => "10.0.10.51",
    :group => "integration" },
  { :hostname => "qa", :box => "centos/stream8", :version => "20210210.0",
    :ram => 2048, :cpu => 2, :host_port => 22252, :guest_ip => "10.0.10.52",
    :group => "integration" },
  { :hostname => "integ", :box => "centos/stream8", :version => "20210210.0",
    :ram => 1536, :cpu => 2, :host_port => 22253, :guest_ip => "10.0.10.53",
    :group => "integration" },
  { :hostname => "prod", :box => "centos/stream8", :version => "20210210.0",
    :ram => 1536, :cpu => 2, :host_port => 22254, :guest_ip => "10.0.10.54",
    :group => "deploy" },
  { :hostname => "jenkins", :box => "centos/stream8", :version => "20210210.0",
    :ram => 1536, :cpu => 2, :host_port => 22255, :guest_ip => "10.0.10.55",
    :group => "infra" },
  { :hostname => "gitlab", :box => "centos/stream8", :version => "20210210.0",
    :ram => 3072, :cpu => 2, :host_port => 22256, :guest_ip => "10.0.10.56",
    :group => "infra" },
  { :hostname => "gitlab1", :box => "centos/stream8", :version => "20210210.0",
    :ram => 3072, :cpu => 2, :host_port => 22257, :guest_ip => "10.0.10.57",
    :group => "infra" },
  { :hostname => "terraform", :box => "centos/stream8", :version => "20210210.0",
    :ram => 2048, :cpu => 2, :host_port => 22258, :guest_ip => "10.0.10.58",
    :group => "ansible" },
  { :hostname => "jagent1", :box => "centos/stream8", :version => "20210210.0",
    :ram => 1536, :cpu => 2, :host_port => 22259, :guest_ip => "10.0.10.59",
    :group => "ansible" }
]

devs = [
  { :hostname => "dev001", :box => "centos/stream8", :version => "20210210.0",
    :ram => 4096, :cpu => 2, :host_port => 22261, :guest_ip => "10.0.10.61",
    :group => "development" },
  { :hostname => "qa001", :box => "centos/stream8", :version => "20210210.0",
    :ram => 4096, :cpu => 2, :host_port => 22271, :guest_ip => "10.0.10.71",
    :group => "quality" }
]
```

The inventory “hosts” file for Ansible is automatically regenerated during “vagrant up”


### Provisioners


| Name                               | Run     | In script | Description                         |
|:-----------------------------------|:-------:|:---------:|:------------------------------------|
| set_timezone                       | once    | yes | set timezone |
| sync_current_time                  | once    | yes | synchronize current date and time |
| update_kernel                      | never   | yes | update the kernel version of CentOS to the latest |
| remove_old_kernels                 | once    | yes | remove old kernels of CentOS |
| resize_filesystem                  | never   | yes | resize the main partition |
| check_new_kernel                   | always  | yes | check if a new kernel has been released |
| change_default_route               | always  | yes | change the default route for the VM |
| install_python39                   | once    | yes | install python 3.9 |
| set_alternatives                   | once    | yes | set python 3.9 as default |
| add_ssh_public_key_for_ansible     | once    | yes | copy amdin publicj keys to authorized_keys |
| set_server_multi_user_target       | never   | yes | set multi-user server conf of CentOS without GUI |
| set_server_gui_multi_user_target   | never   | no  | set multi-user server conf of CentOS with GUI |
| set_workstation_graphical_target   | never*  | yes | set multi-user workstation conf of CentOS with GUI |
| get_current_default_kernel         | always  | yes | get current kernel version of CentOS |
| update_system                      | never   | yes | update the OS version of CentOS to the latest |
| ansible_raw_ssh_args_for_servers   | once    | yes | use the generated list of the VM's SSH key files |
| play_ansible_for_developers        | always  | no  | use the generated list of the VM's SSH key files |
| mark_provisioning                  | always  | yes | mark that the provisioning has been completed |
| install_virtualbox_guets_additions |         | no  | install virtualbox guest additions |


* "once" for the development env
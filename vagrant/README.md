# Vagrant configuration


## Vagrantfile


### List of VMs

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


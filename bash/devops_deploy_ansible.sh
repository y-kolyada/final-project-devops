#!/bin/bash

# devops_install_ansible.sh
# updated: 2023-02-10
#
# Prerequisites:
# - EPEL repository
# - python3
#
# Links:
# https://docs.python.org/3/installing/index.html
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

sudo dnf install -y epel-release

python3 -m ensurepip --default-pip
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install ansible

ansible --version
# ansible-config view

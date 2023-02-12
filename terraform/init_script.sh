#!/bin/bash

sudo dnf install -y epel-release
sudo dnf install -y python39
python3 -m ensurepip --upgrade --default-pip
pip3 install --upgrade pip

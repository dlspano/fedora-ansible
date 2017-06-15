#!/usr/bin/env bash

gcc_exec=$(which gcc)
virtual_env_exec=$(which virtualenv)
virtual_env_path="${PWD}/venv"

function install_dependencies () {
  sudo dnf -y install gcc python-virtualenv \
  redhat-rpm-config libffi-devel openssl-devel \
  libselinux-python
}

function setup_venv () {
  echo "${virtual_env_path} exists"
  echo "Creating virtual environment"
  ${virtual_env_exec} ${virtual_env_path}
  source ${virtual_env_path}/bin/activate
  pip install -r requirements.txt
  echo "Virtual environment setup complete"
}

install_dependencies
setup_venv

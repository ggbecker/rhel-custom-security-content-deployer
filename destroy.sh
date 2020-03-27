#!/bin/bash
ansible-playbook --ssh-extra-args "-F ssh_config" -e destroy_lab=true main.yml

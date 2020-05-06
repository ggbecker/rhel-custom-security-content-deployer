#!/bin/bash
ansible-playbook --ssh-extra-args "-F ssh_config" -e workshop=rhel-security main.yml

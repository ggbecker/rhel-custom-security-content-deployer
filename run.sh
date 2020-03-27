#!/bin/bash
ansible-playbook --ssh-extra-args "-F ssh_config" main.yml

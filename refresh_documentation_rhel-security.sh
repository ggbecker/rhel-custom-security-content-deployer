#!/bin/bash
ansible-playbook main.yml --tags "deploy-bookbag" -e workshop=rhel-security

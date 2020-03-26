#!/bin/bash

if [[ "$0" =~ run.sh$ ]]; then
  playbook="main.yml"
elif [[ "$0" =~ stop.sh$ ]]; then
  playbook="destroy.yml"
else
  echo "Invalid script $0 executed."
fi

if [ "$1" == "" ]; then
  echo "$0 rhel|selinux|rhel-custom-security-content"
  echo "Please specify either rhel (RHEL Security) or selinux (SELinux Policy) or rhel-custom-security-content (Custom Security Content) for a lab to create or destroy."
  exit 1
fi

cd ~/agnosticd/ansible
if [ "$1" == "rhel" ]; then
  ansible-playbook -e @~/aws/myconfigs/sample_vars.yml -e @~/.aws/opentlc_creds.yml $playbook > output
elif [ "$1" == "selinux" ]; then
  ansible-playbook -e @~/aws/myconfigs/sample_vars-selinux.yml -e @~/.aws/opentlc_creds.yml $playbook > output
elif [ "$1" == "rhel-custom-security-content" ]; then
  ansible-playbook -e @~/aws/myconfigs/sample_vars-rhel-custom-security-content.yml -e @~/.aws/opentlc_creds.yml $playbook > output
else
  echo "Lab name $1 is invalid. Please specify either rhel (RHEL Security) or selinux (SELinux Policy) or rhel-custom-security-content (Custom Security Content) for a lab to create or destroy."
  exit 1
fi

exit $?

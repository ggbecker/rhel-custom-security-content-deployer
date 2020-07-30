#!/bin/bash

case $1 in
  "")
    echo "usage: $0 docker|podman [rhel-security]"
    exit 1
    ;;

  "docker")
    echo "starting build with docker documentation"
    ;;

  "podman")
    echo "starting build with podman documentation"
    ;;

  *)
    echo "usage: $0 docker|podman [rhel-security]"
    exit 1
    ;;
esac

case $2 in
  "")
    ansible-playbook --ssh-extra-args "-F ssh_config" -e workshop="rhel-custom-security-content" "$1=true" -e destroy_lab=true main.yml
    ;;

  "rhel-security")
    ansible-playbook --ssh-extra-args "-F ssh_config" -e workshop="rhel-security" -e "$1=true" -e destroy_lab=true main.yml
    ;;

  *)
    echo "usage: $0 docker|podman [rhel-security]"
    exit 1
    ;;
esac

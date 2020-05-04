#! /bin/bash

useradd pepe
echo "pepe" | passwd --stdin pepe
cp /opt/docker/sshd_config /etc/ssh/sshd_config


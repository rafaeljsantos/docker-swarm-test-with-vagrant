#!/bin/bash

curl -fSsL https://get.docker.com | bash -
usermod -a -G docker vagrant
if [ -f /vagrant/join ]; then
  bash /vagrant/join
else
  docker swarm init --advertise-addr 192.168.10.1
  docker swarm join-token manager | grep docker > /vagrant/join
fi

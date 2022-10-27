#!/bin/bash

  #Author: Laure
  #Date: 25-10-2022
  ######Script to install docker in centos####

echo "docker is about to install in a few min..."

yum remove docker
yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
yum list docker-ce --showduplicates | sort -r
yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io docker-compose-plugin
systemctl start docker
docker run hello-world
yum install /path/to/package.rpm
systemctl start docker
docker run hello-world
yum -y upgrade

echo "Upgrade Docker Engine"
curl -fsSL https://get.docker.com -o get-docker.sh
DRY_RUN=1 sudo sh ./get-docker.sh
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo "Install pre-releases"
curl -fsSL https://test.docker.com -o test-docker.sh
sh test-docker.sh

echo "uninstall docker engine"
yum remove docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "delete all images, containers, and volumes"
rm -rf /var/lib/docker
rm -rf /var/lib/containerd
echo "Installation done!"


#!/bin/bash

echo "==============Pre-requisits packages===================="
sudo yum install -y java-11-openjdk
sudo yum install -y wget
sudo yum install -y git
sudo yum install -y firewalld
sudo yum install -y unzip
hostnamectl set-hostname terraform-base


echo "=================Inatallation and configuration of Terraform=================="
sudo curl -O https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_linux_amd64.zip
unzip terraform_1.2.4_linux_amd64.zip -d /usr/local/bin/
terraform --version

echo "===============firewall setup================="
systemctl start firewalld
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

echo "=============Starting of installation and configuration of Jenkins============="

sudo wget http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo -O /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo dnf install -y jenkins
systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins
exec bash

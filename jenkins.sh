#!/bin/bash

echo "==============Pre-requisits packages===================="
sudo yum install -y java-11-openjdk
sudo yum install -y wget
sudo yum install -y git
sudo yum install -y firewalld
sudo yum install -y unzip
hostnamectl set-hostname terraform-base


echo "=================Inatallation and configuration of Terraform=================="
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
terraform --version

echo "===============firewall setup================="
systemctl start firewalld
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

echo "=============Starting of installation and configuration of Jenkins============="

sudo wget http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo -O /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install -y java-17-openjdk
sudo yum install -y jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
exec bash

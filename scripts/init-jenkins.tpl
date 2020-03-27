#!/bin/bash

sudo yum -y install java-1.8*
java -version

# Install jenkins
yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y install jenkins

# Start jenkins service
service jenkins start

# Setup Jenkins to start at boot,
chkconfig jenkins on

# Install git
yum -y install git

# Download cli jenkins
sudo wget http://localhost:8080/jnlpJars/jenkins-cli.jar

# Download git plugin
wget https://updates.jenkins.io/latest/github.hpi

# install git plugin
java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin github.hpi
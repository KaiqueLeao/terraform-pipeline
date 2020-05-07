#!/bin/bash

sudo yum -y install java-1.8*
java -version

# Install git
sudo yum -y install git

# Install jenkins
yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y install jenkins

# Start jenkins service
service jenkins start

# Setup Jenkins to start at boot,
chkconfig jenkins on

# Creating maven directory under /opt
sudo mkdir /opt/maven

# downloading maven version 3.6.0
sudo cd /opt/maven
sudo wget -P /opt/maven/ http://mirror.nbtelecom.com.br/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
sudo tar -xvzf /opt/maven/apache-maven-3.6.3-bin.tar.gz -C /opt/maven
sudo apt-get -y update
sleep 60

# set maven environment variable
export M2_HOME=/opt/maven/apache-maven-3.6.3
export M2=$M2_HOME/bin
export PATH=$PATH:$M2_HOME:$M2
terraform apply

# # Creating jenkins directory under /opt
# sudo mkdir /opt/jenkins

# # Download cli jenkins
# sudo wget -P /opt/jenkins/ http://127.0.0.1:8080/jnlpJars/jenkins-cli.jar

# # Download git plugin
# sudo wget -P /var/lib/jenkins/plugins https://updates.jenkins.io/latest/github.hpi

# # install git plugin
# sudo java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ install-plugin github
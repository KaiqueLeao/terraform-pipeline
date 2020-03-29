#!/bin/bash

sudo yum -y install java-1.8*
java -version

# Create tomcat directory
sudo cd /opt
sudo wget -P /opt http://ftp.unicamp.br/pub/apache/tomcat/tomcat-8/v8.5.53/bin/apache-tomcat-8.5.53.tar.gz
sudo tar -xvzf /opt/apache-tomcat-8.5.53.tar.gz

# give execution permissions
sudo chmod +x /opt/apache-tomcat-8.5.53/bin/startup.sh /opt/apache-tomcat-8.5.53/bin/shutdown.sh
sleep 60

# creating link files
sudo ln -s /opt/apache-tomcat-8.5.53/bin/startup.sh /usr/local/bin/tomcatup
sudo ln -s /opt/apache-tomcat-8.5.53/bin/shutdown.sh /usr/local/bin/tomcatdown
tomcatup
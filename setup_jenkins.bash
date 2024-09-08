#!/bin/bash

# Perform updates
sudo apt-get update

# Install openjdk17 && jre17
sudo apt-get install openjdk-17-jdk -y 

# export Java PATH 
echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/\nexport PATH=${JAVA_HOME}/bin:${PATH}" >> /etc/profile.d/java.bash

# source the java.sh file
source /etc/profile.d/java.bash

# Install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]  https://pkg.jenkins.io/debian-stable binary/ | sudo tee  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt-get install jenkins -y

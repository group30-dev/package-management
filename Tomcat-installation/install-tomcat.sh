#!/bin/bash
# Use this script to install tomcat in rehat servers
echo delete the failed version of tomcat
sudo rm -rf /opt/tomcat9
echo assign a hostname to your server 
sudo hostname tomcat
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
cd /opt 
sudo yum install git wget -y
sudo yum install java-1.8.0-openjdk-devel -y
# Download tomcat software and extract it.
sudo yum install wget unzip -y

sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz
sudo tar -xvf apache-tomcat-9.0.64.tar.gz
sudo rm apache-tomcat-9.0.64.tar.gz
sudo mv apache-tomcat-9.0.64 tomcat9
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R /opt/tomcat9
sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo yum update -y
starttomcat
echo "end on tomcat installation"
#========

#2. Start of tomcat configuration 


#Tomcat server configuration:
find / -name server.xml context.xml
vi /opt/tomcat9/conf/server.xml
vi /opt/tomcat9/conf/context.xml
vi /opt/tomcat9/webapps/manager/META-INF/context.xml


#Important configuration details:
vi /opt/tomcat9/conf/tomcat-user.xml  # to add user find the 5 lines (2 roles & 3 user lines) below then copy and paste the last 3 lines below:

<!--
  <role rolename="tomcat"/>
  <role rolename="role1"/>
  <user username="tomcat" password="<must-be-changed>" roles="tomcat"/>
  <user username="both" password="<must-be-changed>" roles="tomcat,role1"/>
  <user username="role1" password="<must-be-changed>" roles="role1"/>
-->
  <role rolename="manager-gui"/>
  <role rolename="manager-scripts"/>
  <user username="landmark" password="admin123" roles="manager-gui,manager-scripts"/>


 vi /opt/tomcat9/webapps/manager/META-INF/context.xml  # Make sure Value className is commented out with <!-- & --> and looks like below:
 
 <!--  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
  
	
	

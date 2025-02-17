#  **<span style="color:green">Landmark Technologies.</span>**
### **<span style="color:green">Contacts: +1437 215 2483<br> WebSite : <http://mylandmarktech.com/></span>**
### **Email: mylandmarktech@gmail.com**



## Jenkins Installation And Setup In AWS EC2 Redhat Instance.
##### Prerequisite
+ AWS Acccount.
+ Create Redhat EC2 t2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 8080 got Jenkins, ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+ for SonarQube version 7.8

### Install Java JDK 11 as Jenkins pre-requisit
### Install other softwares such as tree, git, unzip and wget

``` sh
sudo hostnamectl set-hostname jenkins
sudo yum -y install unzip wget tree git
sudo yum install java-11-openjdk -y
```

###  Add Jenkins Repository and key

```sh
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
```

## Install Jenkins

```sh
sudo yum -y install jenkins
```

# start Jenkins  service and verify Jenkins is running

```sh
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
```

# Access Jenkins from the browser

```sh
public-ip:8080
curl ifconfig.co 
```

# get jenkins initial admin password

```sh
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```


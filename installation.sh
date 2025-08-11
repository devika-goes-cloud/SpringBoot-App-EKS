


sudo yum update -y
sudo yum install git -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl restart jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins



# sudo yum install git -y
# sudo yum install java -y

sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
docker --version
sudo docker version


docker images
docker ps



# If jenkins as docker container then below commands:
# docker run -d -p 8081:8080 --name jenkins-container jenkins/jenkins:lts
# docker exec -it jenkins-container bash
# cat /var/jenkins_home/secrets/initialAdminPassword


##############################
Maven installation: 
###############################
cd /opt
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.tar.gz
sudo tar -xzf apache-maven-3.9.11-bin.tar.gz
sudo mv apache-maven-3.9.11 maven
sudo rm apache-maven-3.9.11-bin.tar.gz



# You need to:

# Install Trivy CLI on the Jenkins agent/executor**

# If Jenkins runs directly on the EC2 host, install Trivy there (using the commands I gave before).

# If Jenkins runs inside a Docker container, you’ll need to rebuild that container with Trivy installed.


#############
RHEL based  - Trivy

#########

# Trivy installation
cat << EOF | sudo tee -a /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy repository
baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://aquasecurity.github.io/trivy-repo/rpm/public.key
EOF
sudo yum -y update
sudo yum -y install trivy




#############
Ubuntu based Trivy

#########
# install trivy
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy



##########################
# Install kubectl:-
#######################

# Download the latest release binary

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Make the binary executable
chmod +x kubectl

# Move it to a directory in your PATH
sudo mv kubectl /usr/local/bin/

# Verify installation
kubectl version --client

##########################
# Install eksctl:-
#######################

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
# Move the binary to /usr/local/bin
sudo mv /tmp/eksctl /usr/local/bin

# Check version
eksctl version



##########################
# Install aws cli:-
#######################

sudo yum install awscli -y

aws --version





##################

# Sonarqube scanner on separate server:-
####################

# Download SonarQube Community Edition (latest stable)
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.1.0.73491.zip

# Unzip
unzip sonarqube-10.1.0.73491.zip

# Move to /opt
sudo mv sonarqube-10.1.0.73491 /opt/sonarqube

# Switch to sonarqube user (create if not exists)
sudo useradd sonar
sudo chown -R sonar:sonar /opt/sonarqube

# Edit the sonar.sh script file and set RUN_AS_USER as "sonar" user
sudo vi /opt/sonarqube/bin/linux-x86-64/sonar.sh


# Configure Systemd service
sudo vi /etc/systemd/system/sonar.service


Add the below lines, then save and close the file:-

[Unit] 
Description=SonarQube service 
After=syslog.target network.target 
[Service] 
Type=forking 
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start 
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop 
User=sonar 
Group=sonar 
Restart=always 
[Install] 
WantedBy=multi-user.target


Restart the daemon services to load the sonar service.

sudo systemctl daemon-reload


# Now Start and enable the Sonarqube service to automatically run
sudo systemctl start sonar
sudo systemctl status sonar


Below is alternative to start & status Sonarqube without setting systemd service :-

# Start SonarQube server as sonar user
sudo -u sonar /opt/sonarqube/bin/linux-x86-64/sonar.sh start

# Check status
sudo -u sonar /opt/sonarqube/bin/linux-x86-64/sonar.sh status


Access SonarQube:-

http://server_IP:9000



####################
# Install SonarQube Scanner CLI on your Jenkins Agent 
####################

# Download the latest SonarQube Scanner CLI
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip

# Unzip it
unzip sonar-scanner-cli-4.8.0.2856-linux.zip

# Move to /opt for example
sudo mv sonar-scanner-4.8.0.2856-linux /opt/sonar-scanner

# Add sonar-scanner to PATH by creating a file in .bash_profile
vi ~/.bash_profile


#Then add this line somewhere (usually at the end):

export PATH=$PATH:/opt/sonar-scanner/bin


#Save and exit. Then reload it with:
source ~/.bash_profile





####################
# Install Nexus 
####################

cd /opt
sudo wget https://download.sonatype.com/nexus/3/nexus-3.82.0-08-linux-x86_64.tar.gz

sudo tar -xzf nexus-3.82.0-08-linux-x86_64.tar.gz
sudo mv nexus-3.82.0-08 nexus
sudo rm -f nexus-3.82.0-08-linux-x86_64.tar.gz

sudo useradd nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work



sudo vi /opt/nexus/bin/nexus.rc


# Add:
	
# 	run_as_user="nexus"

sudo su - nexus

cd /opt/nexus/bin 

./nexus start
./nexus status










git clone https://github.com/devika-goes-cloud/SpringBoot-App-EKS.git

cd SpringBoot-App-EKS




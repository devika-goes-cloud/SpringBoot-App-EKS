


sudo yum update -y
sudo yum install git -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y
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
sudo tar -xzf apache-maven-3.9.10-bin.tar.gz
sudo mv apache-maven-3.9.10 maven



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
RHEL based Trivy

#########

# sudo yum update -y

# # 2. Add Trivy repository
# sudo rpm --import https://aquasecurity.github.io/trivy-repo/rpm-public.gpg
# sudo curl -fsSL https://aquasecurity.github.io/trivy-repo/rpm/amzn2/aquasecurity-trivy.repo \
#     -o /etc/yum.repos.d/aquasecurity-trivy.repo

# # 3. Install Trivy
# sudo yum install trivy -y

# # 4. Test installation
# trivy --version


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




git clone https://github.com/devika-goes-cloud/SpringBoot-App-EKS.git


sudo apt update -y
sudo apt install openjdk-17-jdk -y
sudo apt install git -y


sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

sudo systemctl start jenkins
sudo systemctl enable jenkins


sudo apt install maven -y



########
Docker Installation:
##################


sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
docker --version
sudo docker version
sudo docker --version

#############
UBUNTU based  - Trivy

#########
sudo apt-get install wget gnupg
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy






###################
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
# Install eksctl:-  # NOTE: Always use the latest EKSCTL ( good practice so you get latest features for cli )
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


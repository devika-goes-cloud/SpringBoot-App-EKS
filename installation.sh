
sudo yum install git -y
sudo yum install java -y

sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
docker --version
sudo docker version


docker images
docker ps
docker run -d -p 8081:8080 --name jenkins-container jenkins/jenkins:lts
docker exec -it jenkins-container bash
cat /var/jenkins_home/secrets/initialAdminPassword



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



# sudo yum update -y

# # 2. Add Trivy repository
# sudo rpm --import https://aquasecurity.github.io/trivy-repo/rpm-public.gpg
# sudo curl -fsSL https://aquasecurity.github.io/trivy-repo/rpm/amzn2/aquasecurity-trivy.repo \
#     -o /etc/yum.repos.d/aquasecurity-trivy.repo

# # 3. Install Trivy
# sudo yum install trivy -y

# # 4. Test installation
# trivy --version


git clone https://github.com/devika-goes-cloud/SpringBoot-App-EKS.git


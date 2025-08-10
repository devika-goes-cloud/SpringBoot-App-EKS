
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




git clone https://github.com/devika-goes-cloud/SpringBoot-App-EKS.git


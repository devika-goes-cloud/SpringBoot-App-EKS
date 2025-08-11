# springboot-app deployement 
## Result
<img width="1917" height="986" alt="Springboot UI" src="https://github.com/user-attachments/assets/f0e90e44-2601-4f47-b4a6-aee5522faee8" />



## 1. Run in Docker

Building and Running the Docker Image

        docker build -t springboot:v1 .

Run the Docker Container:

        docker run -d -p 8080:8080 --name springboot-conatiner springboot:v1



## Create EKS Cluster with two worker nodes using eksctl

<img width="1491" height="1006" alt="springboot_eks" src="https://github.com/user-attachments/assets/e28e4adb-4cbd-4b00-ad74-e611195d8fa8" />


## Delete EKS Cluster using eksctl

<img width="1482" height="737" alt="EKS_cluster_Delete" src="https://github.com/user-attachments/assets/58b94f1b-c8b6-4107-a0c3-3f04fb02d73c" />



## Jenkins Pipeline build stage Overview:

<img width="1917" height="915" alt="Jenkins_build_cicd" src="https://github.com/user-attachments/assets/74be3823-95c9-46c0-9014-eea72ef3dc2a" />


- **Declarative Tool Install:** Setup of necessary tools and environment preparation.  
- **Git Checkout:** Fetches the latest code from the GitHub repository.  
- **Compile:** Compiles the Spring Boot application source code.  
- **Docker Build and Tag:** Builds the Docker image and tags it appropriately.  
- **Docker Push Image:** Pushes the Docker image to the DockerHub container registry.  
- **Deploy to Kubernetes:** Deploys the updated app to the AWS EKS cluster.







        

pipeline {
    agent any
    tools {
        jdk 'JAVA_HOME'
        maven 'MAVEN_HOME'
    }
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/devika-goes-cloud/SpringBoot-App-EKS.git'
            }
        }
        stage('Compile') {
            steps {
                sh "mvn compile"
            }
        }
        stage('Test') {
            steps {
                sh "mvn test"
            }
        }
        stage('Trivy FS Scan') {
            steps {
                sh "trivy fs --format table -o fs.html . "
                archiveArtifacts 'fs.html'
            }
        }
        stage('Build') {
            steps {
                sh "mvn package -DskipTests=true"
            }
        }
        stage("SonarQube Analysis") {
            steps {
                script {
                    withSonarQubeEnv('sonar-server') {
                        sh '''$SCANNER_HOME/bin/sonar-scanner \
                                -Dsonar.projectName=springboot \
                                -Dsonar.projectKey=springboot \
                                -Dsonar.java.binaries=target'''
                    }
                }
            }
        }
        stage("Quality Gate") {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        stage('Docker build and tag') {
            steps {
                // sh "docker build -t devika12345/springboot:${BUILD_NUMBER} ."
                sh "docker build -t devika12345/springboot:v1-stable ."
            }
        }
        stage('Trivy image Scan') {
            steps {
                sh "trivy image devika12345/springboot:v1-stable --format table -o image.html"
                archiveArtifacts 'image.html'
            }
        }
        stage('Docker Push Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub') {
                        sh "docker push devika12345/springboot:v1-stable"
                    }
                }
            }
        }
        stage('Deploy to kubernets') {
            steps {
                script {
                    withKubeConfig(credentialsId: 'k8s', serverUrl: 'https://B18E12BF81A02624B83DD385816C9EF6.gr7.ap-south-1.eks.amazonaws.com') {
                        sh "kubectl apply -f deployment.yaml"
                        sh "kubectl apply -f service.yaml"
                    }
                }
            }
        }
    }
    post {
        success {
            echo "✅ Build & Quality Gate passed successfully!"
        }
        failure {
            echo "❌ Build failed (check Quality Gate, tests, or other errors)."
        }
        always {
            cleanWs()
        }
    }
}
        

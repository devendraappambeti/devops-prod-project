pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-devops"
    }

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/devendraappambeti/devops-prod-project.git'
                
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

    }
}

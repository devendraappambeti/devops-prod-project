pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-devops"
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/devendraappambeti/devops-prod-project.git'
                
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    bat 'terraform apply -auto-approve'
                }
            }
        }

    }
}

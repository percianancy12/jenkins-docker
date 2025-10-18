pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-cred')
        IMAGE_NAME = "percianancy/jenkins_demo"
    }
    stages {
        stage('Clean workspace') {
            steps {
                echo 'Cleaning Jenkins workspace...'
                deleteDir()
            }
        }

        stage('Clone repo') {
            steps {
                echo 'Cloning repository from GitHub...'
                git branch: 'main', url: 'https://github.com/percianancy12/jenkins-docker'
                echo 'Repository cloned successfully.'
            }
        }

        stage('Build Docker image') {
            steps {
                echo 'Building Docker image with no cache...'
                script {
                    sh 'docker build --no-cache -t $IMAGE_NAME:latest .'
                }
                echo 'Docker image built successfully.'
            }
        }

        stage('Login to DockerHub') {
            steps {
                echo 'Logging in to DockerHub...'
                script {
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
                echo 'Logged in to DockerHub successfully.'
            }
        }

        stage('Push image to DockerHub') {
            steps {
                echo 'Pushing Docker image to DockerHub...'
                script {
                    sh 'docker push $IMAGE_NAME:latest'
                }
                echo 'Docker image pushed successfully.'
            }
        }
    }
}
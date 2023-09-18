pipeline {
    agent any
    environment {
        PATH = "/usr/bin:$PATH"
        DOCKER_IMAGE = 'goubar/mon_site_web'
        DOCKER_HOST = "unix:///var/run/docker.sock"
    }
    stages {
        stage('Print Node Name') {
            steps {
                script {
                    echo "Le nom de l'agent Jenkins est : ${env.NODE_NAME}"
                }
            }
        }

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            environment {
                DOCKER_HOST = '/var/run/docker.sock'
            }
            steps {
                script {
                    
                    sh 'docker build -t goubar/mon_site_web:latest .'

                    
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DockerHubCredentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh """
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                        docker push ${DOCKER_IMAGE}:latest
                    """
                }
            }
        }
    }
}

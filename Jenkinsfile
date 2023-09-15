pipeline {
    agent any 

    stages {
        stage('Build') {
            steps {
                script {
                    def appImage = docker.build("mon-application")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image("mon-application").inside {
                        sh 'npm run test'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        def appImage = docker.image("mon-application")
                        appImage.push("${env.BUILD_NUMBER}")
                        appImage.push("latest")
                    }
                }
        }
    }
}

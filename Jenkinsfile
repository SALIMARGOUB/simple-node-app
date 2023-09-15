pipeline {
    agent any 

    stages {
        stage('Build') {
            steps {
                script {
                    def appImage = docker.build("monapp")
                }
            }
        }

        stage('Test') {
            steps {
                echo "Ici, vous pouvez ajouter des étapes pour tester votre application."
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://your.docker.registry', 'YourDockerCredentialsID') {
                        appImage.push("latest")
                    }
                }
            }
        }
    }
}

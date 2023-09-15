pipeline {
    agent any 

    stages {
        stage('Build') {
            steps {
                script {
                    docker.build("monapp")
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
                    docker.image("monapp").push()
                }
            }
        }
    }
}


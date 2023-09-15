pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build' // Si vous avez un script de build dans votre package.json
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
    }

    post {
        always {
            // Vous pouvez ajouter des étapes à exécuter après le pipeline ici, comme l'archivage des logs, etc.
        }
    }
}

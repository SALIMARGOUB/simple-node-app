pipeline {
    agent any 

    environment {
        DOCKER_IMAGE = 'goubar/mon_site_web' // Remplacez par le nom de votre image Docker
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Compilez votre code source ou effectuez toute autre étape nécessaire ici
                    // Par exemple, si votre application Node.js, vous pouvez exécuter les commandes suivantes :
                    sh 'npm install' // Installez les dépendances
                    sh 'npm run build' // Compilez votre application

                    // Utilisez l'étape docker.build pour construire l'image Docker
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Utilisez l'étape docker.withRegistry pour gérer l'authentification et la poussée
                    docker.withRegistry('', 'Docker Hub Credentials') {
                        // Poussez l'image vers Docker Hub (laissez l'URL du registre vide, Jenkins utilisera Docker Hub par défaut)
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }
    }
}

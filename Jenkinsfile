pipeline {
    agent any 

    environment {
        DOCKER_REGISTRY = 'https://registry.efi-academy.com'
        DOCKER_CRED_ID = 'docker-harbor'
        DOCKER_IMG = 'registry.efi-academy.com/projet-g11/tomcat_psql'
        IMG_TAG = '0.0'
    }

    stages {
        stage("Clone") {
            steps {
                git credentialsId: 'id_gitlab', url: 'https://repo-dev.efi-academy.com/saidhmr98/maven-postgres-app-g11.git'
            }
        }

        stage("Build & Push") {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_CRED_ID}") {
                        sh 'docker build -t ${DOCKER_IMG}:${IMG_TAG} .'
                        sh 'docker push ${DOCKER_IMG}:${IMG_TAG}'
                    }
                }
            }
        }

        stage("Deploy") {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_CRED_ID}") {
                        sh 'docker-compose up -d'
                    }
                }
            }
        }
    }
}

pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'sharanperla/docker-demo'
        DOCKER_CREDENTIALS_ID = 'docker-hub-creds'  // set this in Jenkins
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/yourusername/your-springboot-repo.git'
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: "${DOCKER_CREDENTIALS_ID}", url: '']) {
                    script {
                        docker.image("${DOCKER_IMAGE}").push('latest')
                    }
                }
            }
        }
    }
}

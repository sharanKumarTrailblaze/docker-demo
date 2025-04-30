pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'sharankumartrailblaze/docker-demo'
        DOCKER_CREDENTIALS_ID = 'docker-hub-creds'
         GIT_CREDENTIALS_ID = 'github-credentials'
    }

    stages {
        stage('Clone') {
            steps {
                 git branch: 'main', url: 'https://github.com/sharankumartrailblaze/docker-demo.git'
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
                script {
                    docker.withRegistry('', "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${DOCKER_IMAGE}").push('latest')
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Build and push successful!"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}

pipeline {
    agent {
        label "lab-server"
    }

    environment {
        SONAR_HOST_URL = "http://192.168.189.103:9000"
        SONAR_TOKEN = "sqa_107ef127e21d5b8639ae623e9f4f40f514a2de00"
    }

    stages {
      stage('Checkout Code Frontend') {
            steps {
                git branch: 'main', url: 'https://github.com/v4224/Frontend.git'
            }
        }

        stage('SonarQube Analysis - Begin') {
            steps {
                script {
                    withSonarQubeEnv('sonarqube-server') {
                        sh """
                            dotnet sonarscanner begin \
                            /k:"my-frontend-project" \
                            /d:sonar.host.url=$SONAR_HOST_URL \
                            /d:sonar.login=$SONAR_TOKEN
                        """
                    }
                }
            }
        }
        
        stage('Build Frontend') {
            steps {
                script {
                    sh(script: "docker build -t onlineshop-frontend .")
                }
            }
        }

        stage('Trivy Scan') {
            steps {
                script {
                    sh(script: """docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy clean --all""")
                    sh(script: """docker run --rm -v \$(pwd):/frontend -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --format template --template "@contrib/html.tpl" --output /frontend/frontend-trivy-scan.html onlineshop-frontend""")
                }
            }
        }
        
        stage('Deploy Frontend to Docker') {
            steps {
                script {
                    sh(script: """docker rm -f onlineshop-frontend; docker run --name onlineshop-frontend -dp 3000:80 onlineshop-frontend""")
                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'frontend-trivy-scan.html', fingerprint: true
        }
    }
}

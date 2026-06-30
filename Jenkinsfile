pipeline {
    agent any

    parameters {
        booleanParam(name: 'deploy', defaultValue: true, description: 'Deploy the application on the EC2 server.') 
    }

    stages {
        ...
        stage('Build and Push Docker Image') {
            ...
        }
        stage('Deploy to EC2') {
            when {
                expression {
                    params.deploy
                }
            }
            steps {
                script {
                    echo 'deploying Docker image to EC2 server...'
                    
                    def dockerComposeCmd = "IMAGE_TAG=${IMAGE_VERSION} docker-compose up -d"
                    def ec2Instance = "ec2-user@3.122.205.189"

                    sshagent(['ec2-server-key']) {
                        sh "scp -o StrictHostKeyChecking=no docker-compose.yaml ${ec2Instance}:/home/ec2-user"
                        sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${dockerComposeCmd}"
                    }
                }
            }
        }
        stage('Commit Version Update') {
            ...
        }
    }
}

pipeline{
    agent any


    stages{

        stage('Setup'){
            steps{
                sh 'pip3 install -r requirements.txt'
            }
        }

        stage('Test'){
            steps{
                pytest
            }
        }

        stage('Build'){
            steps{
                // sh 'python3 serverless.py'
                sh 'sam build -t template.yaml'
            }
        }

        stage('Deploy'){

            environment{
                AWS_ACCESS_KEY_ID = credentials('aws-access-key')
                AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
            }

            steps{
                sh 'sam deploy -t template.yaml --no-confirm-changeset --no-fail-on-empty changeset'
            }
        }
    
    }
}
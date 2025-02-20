pipeline{
    agent {
        docker{
            image 'memo24/my-lambda:latest'
            args '-v $HOME/.aws:/root/.aws' // mounts aws credentials to the container 
        }
    }


    stages{

        stage('Setup'){
            steps{
                sh 'pip3 install -r requirements.txt'
            }
        }


        stage('Build'){
            steps{
                sh 'sam build -t template.yaml'
            }
        }

                stage('Test'){
            steps{
                sh 'pytest test.py'
            }
        }

        stage('Deploy'){

            environment{
                AWS_ACCESS_KEY_ID = credentials('aws-access-key')     
                AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key') // both secrets are stored in Jenkins credentials
            }

            steps{
                sh 'sam deploy -t template.yaml --no-confirm-changeset --no-fail-on-empty changeset'
            }
        }
    
    }
}
pipeline{
    agent {
        docker{
            image 'memo24/my-lambda:latest'
        }
    }


    stages{

        stage('initialize'){
            steps{
                script{
                    def grv = load 'script.groovy'
                }
            }
        }

        {
            steps{
                script{
                    grv.setup()
                }
            }
        }

        stage('Build'){
            steps{
                script{
                    grv.buildApp()
                }
                
            }
        }

        stage('Test'){
            steps{
                script{
                    grv.testApp()
                }
            }
        }

        stage('Deploy'){
            environment{
                AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')     
                AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') // both secrets are stored in Jenkins credentials
            }
            steps{
                script{
                    grv.deployApp()
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed. Cleaning up...'
        }
        failure {
            echo 'Pipeline failed. Sending notification...'
        }
    }
}
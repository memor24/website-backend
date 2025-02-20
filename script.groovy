
def buildApp(){
    sh 'sam build -t template.yaml'
}

def testApp(){

    sh 'pytest test.py'
}

def deployApp(){
        
    sh 'sam deploy -t template.yaml --no-confirm-changeset --no-fail-on-empty-changeset'
            
}
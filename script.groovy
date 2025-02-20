

def setupdApp(){
    sh 'pip3 install -r requirements.txt'
}

def buildApp(){
    sh 'pip3 install -r requirements.txt'
}

def testApp(){
    sh 'pytest'
}

def deployApp(){
    sh 'cp -r ./dist/* /var/www/html'
}
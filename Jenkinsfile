pipeline {
    agent any
    triggers {
        GenericTrigger(
            genericVariables: [[key: 'commiter', value: '$.head_commit.author.email']],
            causeString: 'Triggered by commiter',
            token: 'test',
            printContributedVariables: true,
            printPostContent: true,
            silentResponse: false
        )
    }
    stages {
        stage('Checkout project') {
            steps {
                script {
                    if(commiter) {
                        echo commiter
                    } else {
                        echo 'Sem email'
                    }
                }
            }
        }
        stage('Checkout ansible') {
            steps {
                checkout(
                    [$class: 'GitSCM', 
                    branches: [[name: '*/master']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'SparseCheckoutPaths', sparseCheckoutPaths: [[path: 'HelloWorld']]]], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[url: 'https://github.com/andre-d-gomes/CalculatorLibrary.git']]])
                sh 'ls -la'
            }
        }
        stage('Build and Tests') {
            steps {
                echo 'Build and Tests'
            }
        }
    }
}

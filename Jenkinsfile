pipeline {
    agent any
    stages {
        stage('Checkout project') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/andre-d-gomes/HelloWorld.git']]])
                cleanWs()
            }
        }
        stage('Checkout ansible') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'SparseCheckoutPaths', sparseCheckoutPaths: [[path: 'HelloWorld']]]], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/andre-d-gomes/CalculatorLibrary.git']]])
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

pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/andre-d-gomes/CalculatorLibrary.git']]])
            }
        }
        stage('Build') {
            steps {
                script {
                    def docker_image = docker.build("py-test:0.1.0")
                    
                    docker.image("py-test:0.1.0").withRun() { c ->
                        docker.image("py-test:0.1.0").inside() {
                            sh 'pwd'
                            sh 'ls -la'
                            sh 'python -c "print(123123)"'
                        }
                    }
                }
            }
        }
    }
}

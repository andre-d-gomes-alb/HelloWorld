pipeline {
    agent any
    options {
        skipDefaultCheckout true
    }
    triggers {
        GenericTrigger(
            genericVariables: [[key: 'commiter', value: '$.head_commit.author.email'], [key: 'user', value: '$.head_commit.author.name']],
            causeString: 'Triggered by $user ($commiter)',
            token: 'test',
            printContributedVariables: false,
            printPostContent: false,
            silentResponse: false
        )
    }
    stages {
        stage('Checkout ansible') {
            steps {
                checkout([
                    $class: 'GitSCM', 
                    branches: [[name: '*/master']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'SparseCheckoutPaths', sparseCheckoutPaths: [[path: 'HelloWorld']]]], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[url: 'https://github.com/andre-d-gomes/CalculatorLibrary.git']]
                ])
            }
        }
        stage('Build and Tests') {
            steps {
                echo 'Build and Tests'
            }
        }
    }
    post {
        failure {
            script {
                if(env.commiter) {
                    emailext(
                        body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}console",
                        to: commiter,
                        subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
                    )
                }
            }
        }
    }
}

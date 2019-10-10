pipeline {
    agent any
    options {
        skipDefaultCheckout true
    }
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
        stage('Checkout commiter') {
            steps {
                script {
                    if(!env.commiter) {
                        wrap([$class: 'BuildUser']) {
                            commiter = env.BUILD_USER_EMAIL
                        }
                    }
                    echo commiter
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
            emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}console",
                     recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
                     subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
        }
    }
}

def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]

pipeline {
    agent any

    tools {
        terraform 'Terraform'
    }
    
    stages {
        stage('Git checkout') {
            steps {
                echo 'Cloning the project codebase..............'
                git branch: 'main', url: 'https://github.com/emehmeshachojong/airbnb-infrastructure.git'
                // sh 'pwd'
                // sh 'ls'
            }
        }
        
        stage('Terraform init') {
            steps {
                echo 'Terraform init..............'
                sh 'terraform init'
            }
        }
        
        stage('Terraform validate') {
            steps {
                sh 'terraform validate'
            }
        }
        
        stage('Terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }
        
        stage('Manual approval') {
            steps {
               input 'Deploy the infrastructure?'
            }
        }        
        
        stage('Terraform destroy') {
            steps {
                sh 'terraform destroy --auto-approve'
            }
        }
        
    }
    
    post {
    always {
        echo 'I will always say Hello again!'
        slackSend channel: '#team-devops', color: COLOR_MAP[currentBuild.currentResult], message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
}
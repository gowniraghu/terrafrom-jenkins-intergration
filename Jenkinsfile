pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'ap-south-1'
        ENVIRONMENTS_PATH     = "."
    }

    tools {
            terraform 1.6.4
        }

    stages {
        stage('Checkout code') {
            steps {
                cleanWs()
                checkout scm
            }
        }

        stage('Terraform Init, Plan, and Apply') {
            steps {
                script {
                    dir("${ENVIRONMENTS_PATH}") {
                        sh "terraform init"
                        sh "terraform plan -out=tfplan"
                        sh "terraform apply -auto-approve tfplan"
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

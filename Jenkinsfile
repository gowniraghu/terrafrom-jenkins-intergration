pipeline {
    agent any
    environment {
            AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_OGS')
            AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY_OGS')
            AWS_DEFAULT_REGION    = 'eu-west-1'
            ENVIRONMENTS_PATH     = "environments/single_vm"
        }
    stages {
        stage('Checkout code') {
            steps {
                cleanWs()
                checkout scm
            }
        }

        stage('Create Terraform Plan for Environment') {
            steps{
                ansiColor('xterm') {
                script{
                        def status = sh(script: "terraform workspace select ${ENV_NAME}", returnStatus: true)
                        if (status !=0 ){
                            sh "terraform workspace new ${ENV_NAME}"
                        }
                        sh "cp ${ENVIRONMENTS_PATH}/${ENV_NAME}/main.tf main.tf"
                        sh "terraform get"
                        sh "terraform plan -var-file terraform.tfvars -var-file secrets.tfvars  -var-file ${ENVIRONMENTS_PATH}/${ENV_NAME}/${ENV_NAME}.tfvars"
                    }
                }
            }
        }

        stage('Apply terraform plan') {
            steps {
                ansiColor('xterm') {
                    sh "terraform workspace select ${ENV_NAME}"
                    sh "terraform apply -var-file terraform.tfvars -var-file secrets.tfvars  -var-file ${ENVIRONMENTS_PATH}/${ENV_NAME}/${ENV_NAME}.tfvars"
                }
            }
        }

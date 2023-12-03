# terrafrom-jenkins-intergration
# A simple Terraform code to create AWS EC2 instance through Jenkins .
Written Jenkins file to create ece instance.
# Created below envrionment varaible and stored those credentails in jenkins (within Credential section)
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'ap-south-1'
        ENVIRONMENTS_PATH     = "."
#  define Terraform as tool and this version is defined in Jenkins global Tool configuration.
         tools {
            terraform "1.6.4"
        }
  #  Below the shell commands to in order to work for creating aws resource.

                    dir("${ENVIRONMENTS_PATH}") {
                        sh "terraform init"
                        sh "terraform plan -out=tfplan"
                        sh "terraform apply -auto-approve tfplan"
                        sh 'terraform destroy -auto-approve'
                    }

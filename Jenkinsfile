pipeline {
    agent any
   
  
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master', url: ''
            }
        }
        stage('Run Terraform') {
            steps {
                dir('C:\\Users\\kesavank\\Terraform'){
                  
  //  bat 'C:\\Users\\kesavank\\Terraform\\terraform init'
   // bat 'C:\\Users\\kesavank\\Terraform\\terraform plan'
    //bat 'C:\\Users\\kesavank\\Terraform\\terraform apply -auto-approve'
                        bat'terraform init'
                    bat 'terraform plan'
                    bat 'terraform apply -auto-approve'

                   }
            }
                // sh 'terraform init'
               
               // sh 'terraform plan'
              // sh 'terraform apply'
          //  }
            }
        }
    }


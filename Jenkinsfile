pipeline {
    agent any
    stages {
        stage('DEPLOY QA ENV') {
            steps {
                sh 'terraform init'
                sh 'terraform destroy -auto-approve'
                sh "terraform apply -var dockerimage=${params.image} -auto-approve"
            }
        }

    }
}
pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                echo 'Building...'
                sh 'chmod +x check.sh'
                sh './check.sh'  
                sh './mvnw package'
                echo 'Archiving...'
                archiveArtifacts artifacts: '**/*.jar',
                   allowEmptyArchive: true,
                   fingerprint: true,
                   onlyIfSuccessful: true
                echo 'Copying Artifact...'
                script {
                   step ([$class: 'CopyArtifact',
                   projectName: '${JOB_NAME}',
                   filter: 'target/*.jar',
                   target: '/var/lib/jars',
                   selector: [$class: 'SpecificBuildSelector', buildNumber: '${BUILD_NUMBER}']]);
                }
            }
        }
        stage('Create Artifact') {
            steps {
                script {
                    app = docker.build("${env.dhublog}/petclinic")
                }
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_trusted_reg') {
                        app.push("petclinic.${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
        stage('DEPLOY') {
            steps {
                sh 'terraform init'
                sh 'terraform destroy -auto-approve'
                sh 'terraform apply -auto-approve'                                  
            }      
        }
    }    
}
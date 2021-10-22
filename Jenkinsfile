pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                echo 'Building!!!'
                /*sh './mvnw package'*/
                archiveArtifacts artifacts: '**/*.jar',
                   allowEmptyArchive: true,
                   fingerprint: true,
                   onlyIfSuccessful: true
            }
        }
        /*stage('Copy Archive') {
            steps {
                script {
                   step ([$class: 'CopyArtifact',
                   projectName: '${JOB_NAME}',
                   filter: 'target/*.jar',
                   target: '/var/lib/jars']);
                }
            }
        }*/
    }
    
 }



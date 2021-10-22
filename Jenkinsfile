pipeline {
    agent any
    stages {
        /*stage ('Build') {
            steps {
                echo 'Building!!!'
                sh './mvnw package'
            }
        }*/
        stage('Copy Archive') {
            steps {
                script {
                   step ([$class: 'CopyArtifact',
                   projectName: '${JOB_NAME}',
                   filter: '*.jar',
                   target: '/var/lib/jars']);
                }
            }
        }
    }
    
 }



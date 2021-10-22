pipeline {
    agent any
    stages {
        /stage ('Build') {
            steps {
                echo 'Building!!!'
                /*sh './mvnw package'*/
                sh 'mkdir archive'
                sh 'echo test > archive/test.txt'
                zip zipFile: 'petclinic.zip', archive: false, dir: 'archive'
                archiveArtifacts artifacts: 'petclinic.zip', fingerprint: true
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



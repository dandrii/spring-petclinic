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
                   projectName: 'Project_main',
                   filter: "target/*.jar",
                   target: '/var/lib/jars']);
                }
            }
        }
    }
    
 }



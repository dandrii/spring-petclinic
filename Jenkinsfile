pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                echo 'Building...'
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
                   BuildSelector: '${upstream}',
                   filter: 'target/*.jar',
                   target: '/var/lib/jars']);
                }
            }
        }
    }
    
 }



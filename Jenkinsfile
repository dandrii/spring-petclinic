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
                   filter: 'target/*.jar',
                   target: '/var/lib/jars',
                   selector: [$class: 'SpecificBuildSelector', buildNumber: '${BUILD_NUMBER}']]);
                }
            }
        }
        stage('Create Artifact') {
            when {
                branch 'main'
            }
            steps {
                script {
                    app = docker.build("petclinic")
                }
                script {
                    docker.withRegistry('18.157.160.96:5000/', 'docker_trusted_reg') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }           
        
    }    
}
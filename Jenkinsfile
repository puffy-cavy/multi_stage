pipeline {
    agent any
    stages {
        stage('DEV') { 
            steps {
               echo '[DEV STAGE] stage'
               sh 'source dev/aws.sh'
            }
        }
        stage('QA') { 
            steps {
                echo '[QA STAGE] '
                sh 'source qa/aws.sh'
            }
        }
        stage('Deploy') { 
            steps {
                echo '[DEPLOY STAGE]'
            }
        }
    }
  }
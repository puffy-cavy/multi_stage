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
                script{
                    try { 
                        def INPUT_COMMIT_ID            
                        timeout(time: 1, unit: 'MINUTES') {
                        INPUT_COMMIT_ID = input(id: 'input_id', message: 'Enter the commit id that needs to be deployed', parameters:[booleanParam(name: 'CONTINUE', defaultValue: false, description: 'nothing much') ])}
                        sh "echo ${INPUT_COMMIT_ID} > commitid.txt"
             
                        if (INPUT_COMMIT_ID == true){
                            sh "echo [QA STAGE]"
                        }
                        else{
                            sh "echo [EXIT QA STAGE]"
                            return
                        }
                    }
                    catch(e) {
                       echo('[EXIT QA STAGE]')
                       return
                       throw e
                    }
                }
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
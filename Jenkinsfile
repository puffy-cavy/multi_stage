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
                            sh 'source qa/aws.sh'
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
            }
        }
        stage('Deploy') { 
            steps {
                script{
                try { 
                    def INPUT_Deploy_ID            
                    timeout(time: 1, unit: 'MINUTES') {
                    INPUT_Deploy_ID = input(id: 'input_id', message: 'Enter the commit id that needs to be deployed', parameters:[booleanParam(name: 'CONTINUE', defaultValue: false, description: 'nothing much') ])}
                    sh "echo ${INPUT_Deploy_ID} > commitid.txt"
         
                    if (INPUT_Deploy_ID == true){
                        sh "echo [ENTER DEPLOYMENT STAGE]"
                        sh 'source qa/aws.sh'
                    }
                    else{
                        sh "echo [EXIT DEPLOYMENT STAGE]"
                        return
                    }
                }
                catch(e) {
                       sh "echo [EXIT DEPLOYMENT STAGE]"
                       return
                       throw e
                    }
                }
            }
        }
    }
  }
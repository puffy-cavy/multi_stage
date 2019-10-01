pipeline {
	agent any
 	stages{
 		stage('deployment'){
 			steps {
 				script{
					try { 
						def INPUT_COMMIT_ID            
	                   timeout(time: 1, unit: 'MINUTES') {
	                   INPUT_COMMIT_ID = input(id: 'input_id', message: 'Enter the commit id that needs to be deployed', parameters:[booleanParam(name: 'CONTINUE', defaultValue: false, description: 'nothing much') ])}
	                   sh "echo ${INPUT_COMMIT_ID} > commitid.txt"
	         
	                   if (INPUT_COMMIT_ID == true){
	            			sh "echo continue staging"
		                }
		            	else{
		               		sh "echo STOP"
		               		return
		            	}
	            	}
	                catch(e) {
	                   echo('Skipping Deployment')
	                   return
	                   throw e
	                }
            	}
            }
        }

     	stage('test'){
     		steps{
        		sh "echo ENTER TEST STAGE"
        	}
        }
    }
}

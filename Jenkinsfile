pipeline {
    agent any
    stages {
         stage("checkout"){
	   steps{
	   git 'https://github.com/finloge/IAM.git'
	   }
	                  }
        stage('Setup Postgresh SqlDB') {
            steps {
                sh '''
                chmod +x postgresh.sh
                ./postgresh.sh
                '''
            }
        }
        stage('Setup Python Virtual ENV') {
            steps {
                sh '''
                chmod +x envsetup.sh
                ./envsetup.sh
                '''
            }
        }
        stage('Gunicorn Setup') {
            steps {
                sh '''
                chmod +x gunicorn.sh
                ./gunicorn.sh
                '''
            }
        }
        stage('NGINX Setup') {
            steps {
                sh '''
                chmod +x nginx.sh
                ./nginx.sh
                '''
            }
        }
    }
}

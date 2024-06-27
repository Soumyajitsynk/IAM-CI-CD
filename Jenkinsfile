pipeline {
    agent any
    stages {
         stage("checkout"){
	   steps{
                git branch: 'main', url: 'https://github.com/Soumyajitsynk/IAM-CI-CD.git'	   }
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

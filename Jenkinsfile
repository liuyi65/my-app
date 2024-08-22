pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/liuyi65/my-app.git', branch: 'master'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('jenkinstest')
                }
            }
        }
        
        stage('Deploy to AWS Elastic Beanstalk') {
            steps {
                withCredentials([aws(credentialsId: 'aws-crential')]) {
                    sh 'eb init ThisIsNew -r us-east-2'  // 应用名称和区域已经根据你的设置替换
                    sh 'eb deploy'
                }
            }
        }
    }
}

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AKIA5CBDRAS2S7BRHLVQ') // 使用你的 AWS 凭证 ID
        AWS_SECRET_ACCESS_KEY = credentials('85lUPyT2daVJUM+GptPPNWu8jM/GMeeq5h659LuiHide')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/liuyi65/my-app.git', branch: 'master'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('jenkinstest') // 根据需要更改镜像名称
                }
            }
        }
        
        stage('Deploy to AWS Elastic Beanstalk') {
            steps {
                sh '''
                eb init ThisIsNew --platform node.js --region us-east-2
                eb deploy YLEMTEST
                '''
            }
        }
    }
}

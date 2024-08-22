pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // 检出 GitHub 仓库的代码
                git url: 'https://github.com/liuyi65/my-app.git', branch: 'master'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // 构建 Docker 镜像，命名为 jenkinstest
                    docker.build('jenkinstest')
                }
            }
        }
        
        stage('Deploy to AWS Elastic Beanstalk') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-crential', // 你的 AWS 凭证 ID，需确保已经在 Jenkins 凭证管理中配置
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh '''
                    eb init ThisIsNew --platform node.js --region us-east-2
                    eb deploy YLEMTEST
                    '''
                }
            }
        }
    }
}

pipeline {
    agent any

    stages {
        stage('git clone') {
            steps {
                git 'https://github.com/amirmamdouh12345/graduation_ivolve'
                sh 'whoami'
                sh 'pwd'
                sh 'id'
            }
        }

        stage('Build') {
            steps {
                sh 'cd ./FinalProjectCode/web-app && ./gradlew test && cd ../..'
            }
        }

        stage('build image') {
            steps {
                sh 'cd ./FinalProjectCode/web-app && ./gradlew build && cd ../..'
                sh 'docker build -t amirmamdouh123/java-ivolve .'
            }
        }

        stage('push image') {
            steps {
                withCredentials([usernamePassword(credentialsId:'my-cred', usernameVariable:'USERNAME', passwordVariable:'PASSWORD')]) {
                    sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                    sh 'docker push amirmamdouh123/java-ivolve'
                }
            }
        }

        stage('delete image') {
            steps {
                sh 'docker image rm amirmamdouh123/java-ivolve'
            }
        }
    }
}

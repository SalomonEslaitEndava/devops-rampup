pipeline {
    environment {
        registry = "salomoneslaitendava/devopsrampup-front"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    agent any
    stages {
        stage('deploy'){
            steps {
                sshagent(agent: ['10.0.1.22'],credentials: ['ssh-key']){
                    sh 'ssh 10.0.1.22 git clone https://github.com/SalomonEslaitEndava/kubernetes.git'
                }
            }
        }
    }
}           
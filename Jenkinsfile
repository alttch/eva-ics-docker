pipeline {
  agent any
    environment {
      imageName = "altertech/eva-ics"
    }
  stages {
    stage('build') {
      steps {
        script {
          sh "./download.sh"
          sh "cd build && make"
          sh "cd run && docker build -t ${imageName}:`cat ../eva_build`-${BUILD_NUMBER} ."
        }}
    }
    stage('pub') {
      steps {
        script {
          sh "docker tag ${imageName}:`cat eva_build`-${BUILD_NUMBER} ${imageName}:latest"
          sh "docker push ${imageName}:`cat eva_build`-${BUILD_NUMBER}"
          sh "docker push ${imageName}:latest"
        }
      }
    }
  }
  post {
    always {
        sh "docker rmi ${imageName}:`cat eva_build`-${BUILD_NUMBER}"
        }
    success { sh 'job-notify ok' }
    failure { sh 'job-notify failed' }
  }
}

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
          sh "cd run && make"
        }}
    }
    stage('pub') {
      steps {
        script {
          sh "docker tag ${imageName}:${BUILD_NUMBER} ${imageName}:latest"
          sh "docker push ${imageName}:${BUILD_NUMBER}"
          sh "docker push ${imageName}:latest"
        }
      }
    }
  }
  post {
    always {
        sh "docker rmi ${imageName}:${BUILD_NUMBER}"
        sh "docker rmi ${imageName}:latest"
        }
    success { sh 'job-notify ok' }
    failure { sh 'job-notify failed' }
  }
}

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
          evaInfo = new File('eva_build').text
          sh "cd build && make"
          sh "cd run && docker build -t ${imageName}:`cat ../eva_info`-${BUILD_NUMBER} ."
        }}
    }
    stage('pub') {
      steps {
        script {
          sh "docker tag ${imageName}:`cat eva_info`-${BUILD_NUMBER} ${imageName}:latest"
          sh "docker push ${imageName}:`cat eva_info`-${BUILD_NUMBER}"
          sh "docker push ${imageName}:latest"
        }
      }
    }
  }
  post {
    always {
        sh "docker rmi ${imageName}:`cat eva_info`-${BUILD_NUMBER}"
        sh "docker rmi ${imageName}:latest"
        }
    success { sh 'job-notify ok' }
    failure { sh 'job-notify failed' }
  }
}

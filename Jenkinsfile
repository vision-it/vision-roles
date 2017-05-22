#!/usr/bin/env groovy

properties properties: [[$class: 'GitLabConnectionProperty', gitLabConnection: 'GitLab']]

node {

  def project = 'Vision Roles'
  def container = docker.image('vision.fraunhofer.de/base/ruby:latest')

  try {

    gitlabBuilds(builds: ['checkout', 'build', 'docker-build', 'docker-push']) {

      stage('Checkout source') {
        gitlabCommitStatus('Checkout source') {
          checkout scm
          container.pull()
        }
      }

      container.inside {
        stage("Install fixtures") {
          gitlabCommitStatus('Install fixtures') {
            sh "bundle install"
          }
        }

        stage("Run tests") {
          gitlabCommitStatus('Run tests') {
            sh "bundle exec rake"
          }
        }

      }
    }
  } catch (err) {

        currentBuild.result = "FAILURE"
        mail body: "${project} build error is here: ${env.BUILD_URL}" ,
                 from: 'vision-it@iis.fraunhofer.de',
                 replyTo: 'vision-it@iis.fraunhofer.de',
                 subject: "${project} build failed",
                 to: 'vision-it@iis.fraunhofer.de'
        throw err

  }
}

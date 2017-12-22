#!/usr/bin/env groovy

properties properties: [
  [$class: 'GitLabConnectionProperty', gitLabConnection: 'GitLab'],
  [$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', qartifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10']],
  pipelineTriggers([[
                       $class: "GitLabPushTrigger",
                     triggerOnPush: true,
                     triggerOnMergeRequest: true,
                     triggerOpenMergeRequestOnPush: "both",
                     triggerOnNoteRequest: false,
                     noteRegex: "Jenkins Rebuild",
                     skipWorkInProgressMergeRequest: true,
                     ciSkip: false,
                     setBuildDescription: true,
                     addNoteOnMergeRequest: true,
                     addCiMessage: true,
                     addVoteOnMergeRequest: true,
                     acceptMergeRequestOnSuccess: false,
                     branchFilterType: "NameBasedFilter",
                     targetBranchRegex: "master",
                     includeBranchesSpec: "master",
                     excludeBranchesSpec: ""
                       ]
                   ])
]

node {

  def project = 'Vision Roles'
  def container = docker.image('vision.fraunhofer.de/base/ruby:latest')
  def remote = 'ssh://git@vision-ha.iis.fraunhofer.de:2222/vision-puppet/vision-roles.git'

  try {

      gitlabBuilds(builds: []) {

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

          stage("Push to DMZ") {
              gitlabCommitStatus("Push to DMZ") {
                  withCredentials([sshUserPrivateKey(credentialsId: '1391a8e2-4a16-4302-95d5-f900288a7936', keyFileVariable: 'SSH_KEY')]) {
                      sh 'echo ssh -i $SSH_KEY -l git -o StrictHostKeyChecking=no \\"\\$@\\" > run_ssh.sh'
                      sh 'chmod +x run_ssh.sh'
                      withEnv(['GIT_SSH=./run_ssh.sh']) {
                          sh "git push --force $remote HEAD:${env.BRANCH_NAME}"
                      }
                  }
              }
          }
      }
  } catch (err) {

        currentBuild.result = "FAILURE"
        mail body: "${project} build error is here: ${env.BUILD_URL} (Branch: ${env.BRANCH_NAME})" ,
                 from: 'vision-it@iis.fraunhofer.de',
                 replyTo: 'vision-it@iis.fraunhofer.de',
                 subject: "${project} build failed",
                 to: 'vision-it@iis.fraunhofer.de'
        throw err

  }
}

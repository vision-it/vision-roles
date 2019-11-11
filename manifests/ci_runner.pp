# Role for Gitlab-CI Runner
#
class vision_roles::ci_runner {

  contain ::vision_docker
  contain ::gitlab_ci_runner

}

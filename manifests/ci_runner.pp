# Role for Gitlab-CI Runner
#
class vision_roles::ci_runner {

  contain ::vision_docker
  contain ::vision_loki::server
  contain ::vision_loki::logsync
  contain ::vision_loki::promtail
  contain ::gitlab_ci_runner

}

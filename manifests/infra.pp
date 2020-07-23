# Role for infra server
#
class vision_roles::infra {

  contain ::vision_docker
  contain ::vision_loki::server
  contain ::vision_loki::logsync
  contain ::vision_loki::promtail
  contain ::vision_prometheus
  contain ::vision_bareos
  contain ::vision_mysql::mariadb
  contain ::vision_icinga2::icingaweb2
  contain ::vision_loki::promtail
  contain ::gitlab_ci_runner

}

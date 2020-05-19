# Role for infra server
#
class vision_roles::infra {

  contain ::vision_prometheus
  contain ::vision_aptly
  contain ::vision_bareos
  contain ::vision_mysql::mariadb
  contain ::vision_rsync
  contain ::vision_icinga2::icingaweb2
  contain ::vision_loki::promtail

}

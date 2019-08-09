# Role for infra server
#
class vision_roles::infra {

  contain ::vision_aptly
  contain ::vision_bareos
  contain ::vision_mysql::server
  contain ::vision_rsync
  # contain ::vision_icinga2::icingaweb2

}

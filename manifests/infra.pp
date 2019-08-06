# Role for infra server
#
class vision_roles::infra {

  contain ::vision_bareos
  contain ::vision_icinga2::icingaweb2
  contain ::vision_rsync
  contain ::vision_aptly

}

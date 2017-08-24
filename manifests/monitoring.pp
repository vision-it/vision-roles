# Role for Monitoring server
#
class vision_roles::monitoring {

  contain ::vision_apache::server
  contain ::vision_icinga2::icingaweb2

}

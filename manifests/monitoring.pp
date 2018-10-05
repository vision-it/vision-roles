# Role for Monitoring server
#
class vision_roles::monitoring {

  # vision_icinga is already in default and type server set in Hiera
  contain ::vision_icinga2::icingaweb2

}

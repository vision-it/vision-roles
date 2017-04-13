# Role for second Monitoring server
#
class vision_roles::monitoring {

  contain ::vision_apache::server
  contain ::vision_icinga2::icingaweb2

  # Commented since in development
  # contain ::vision_icinga2::grafana
  # contain ::vision_icinga2::server::feature::graphite

}

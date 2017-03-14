# Role for second Monitoring server
#
class vision_roles::monitoring {

  contain ::vision_apache::server
  contain ::vision_ca
  contain ::vision_icinga2::icingaweb2
  contain ::vision_icinga2::grafana
  contain ::vision_icinga2::server::feature::graphite

  # Legacy
  contain vision::profile::backup::server

}

# Role for Intranet
#
class vision_roles::intranet {

  contain ::vision_icinga2
  contain ::vision_intranet

  # Legacy
  contain ::vision::profile::backup::client

}

# Role for Intranet
#
class roles::intranet {

  contain ::vision_icinga2
  contain ::vision_intranet

  # Legacy
  contain ::vision::profile::backup::client

}

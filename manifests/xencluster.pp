# Role for Xen HA Setup
#
class vision_roles::xencluster {

  contain ::vision_xen

  # Legacy
  contain vision::profile::ha::heartbeat

}

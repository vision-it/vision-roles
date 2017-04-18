# Role for Xen HA Setup
#
class vision_roles::xencluster {

  contain ::vision_xen
  contain ::vision_ha

}

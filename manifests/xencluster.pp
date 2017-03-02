# Role for Xen HA Setup
#
class vision_roles::xencluster {

  contain vision::profile::xen::install
  contain vision::profile::ha::install

}

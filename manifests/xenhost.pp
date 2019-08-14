# Role for Xen Dom0 Server
#
class vision_roles::xenhost {

  contain ::vision_xen

  # Until everything ist masterless, the xen host is the new master
  contain ::vision_puppet::hiera
  contain ::vision_puppet::r10k
  contain ::vision_puppet::server

}

# Role for Puppetservers
#
class vision_roles::puppetserver {

  contain ::vision_puppet::hiera
  contain ::vision_puppet::r10k
  contain ::vision_puppet::server

  # Legacy
  contain vision::profile::backup::client

}

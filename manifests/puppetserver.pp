# Role for Puppetservers
#
class vision_roles::puppetserver {

  contain ::vision_puppet::hiera
  contain ::vision_puppet::r10k
  contain ::vision_puppet::server

  # For testing, will be moved to default
  contain ::vision_bareos

  # Legacy
  # contain vision::profile::backup::client

}

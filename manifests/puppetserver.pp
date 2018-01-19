# Role for Puppetservers
# In Vagrant (vrt) the PuppetDB gets installed on the same machine, in prod not
#
class vision_roles::puppetserver {

  contain ::vision_puppet::hiera
  contain ::vision_puppet::r10k
  contain ::vision_puppet::server

  if $::location == 'vrt' {
    contain ::vision_puppetdb
    Class['::vision_puppetdb']
    -> Class['::vision_puppet::server']
  }

}

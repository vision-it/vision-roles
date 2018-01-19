# Role for PuppetDB Server
#
class vision_roles::puppetdb {

  contain ::vision_puppetdb
  contain ::vision_puppetdb::explorer

}

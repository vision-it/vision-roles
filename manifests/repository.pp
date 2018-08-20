# Role for Docker and Apt Repository
#
class vision_roles::repository (

) {

  contain ::vision_aptutil::cacher
  # Temporary https://github.com/gds-operations/puppet-aptly/pull/69
  # contain ::vision_aptly
  contain ::vision_docker
  contain ::vision_registry

}

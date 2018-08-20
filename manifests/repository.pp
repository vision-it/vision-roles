# Role for Docker and Apt Repository
#
class vision_roles::repository (

) {

  contain ::vision_aptutil::cacher
  contain ::vision_aptly
  contain ::vision_docker
  contain ::vision_registry

}

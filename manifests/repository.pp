# Role for Docker and Apt Repository
#
class vision_roles::repository {

  contain ::vision_apache::server
  contain ::vision_aptcacher
  contain ::vision_aptly
  contain ::vision_docker

  ::docker::image { 'registry':
    ensure    => present,
    image     => 'registry',
    image_tag => '2',
  }

  ::docker::run { 'registry':
    image           => 'registry:2',
    volumes         => [ '/opt/docker:/var/lib/registry' ],
    ports           => [ '5000:5000' ],
    restart_service => true,
  }

}

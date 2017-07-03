# Role for Docker and Apt Repository
#
class vision_roles::repository {

  contain ::vision_aptcacher
  contain ::vision_aptly
  contain ::vision_docker

  ::docker::image { 'registry':
    ensure    => present,
    image     => 'registry',
    image_tag => '2',
  }

  file { '/var/lib/registry':
    ensure => 'directory',
  }
  -> ::docker::run { 'registry':
    image           => 'registry:2',
    volumes         => [ '/var/lib/registry:/var/lib/registry' ],
    ports           => [ '5000:5000' ],
    env             => [
                        'LOG_LEVEL=warn',
                        'REGISTRY_STORAGE_DELETE_ENABLED=true'
                        ],
    restart_service => true,
  }

  cron { 'Daily Docker Registry Garbage Collection':
    ensure => present,
   command => '/usr/bin/docker exec registry garbage-collect /etc/docker/registry/config.yml',
    hour   => 3,
    minute => 21,
  }

}

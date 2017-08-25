# Role for Docker and Apt Repository
#
class vision_roles::repository (
  String $rabbitmq_user = hiera('rabbitmq_user'),
  String $rabbitmq_password = hiera('rabbitmq_password'),
) {

  contain ::vision_aptcacher
  contain ::vision_aptly
  contain ::vision_webhookd
  contain ::vision_docker

  ::docker::image { 'registry':
    ensure    => present,
    image     => 'registry',
    image_tag => '2.6.2',
  }

  file { '/var/lib/registry':
    ensure => 'directory',
  }
  -> ::docker::run { 'registry':
    image           => 'registry:2.6.2',
    volumes         => [ '/var/lib/registry:/var/lib/registry' ],
    ports           => [ '5000:5000' ],
    env             => [
                        'REGISTRY_STORAGE_DELETE_ENABLED=true',
                        'REGISTRY_LOG_LEVEL=warn',
                        'REGISTRY_LOG_ACCESSLOG_DISABLED=true',
                        ],
    restart_service => true,
  }

  cron { 'Daily Docker Registry Garbage Collection':
    ensure  => present,
    command => '/usr/bin/docker exec registry bin/registry garbage-collect /etc/docker/registry/config.yml > /var/log/docker-registry-garbage-collect.log',
    hour    => 3,
    minute  => 21,
  }

  ::docker::image { 'rabbitmq':
    ensure    => present,
    image     => 'rabbitmq',
    image_tag => '3.6.10',
  }
  ::docker::run { 'rabbitmq':
    ensure => present,
    image  => 'rabbitmq:3.6.10',
    ports  => [ '5672:5672' ],
    env    => [
                "RABBITMQ_DEFAULT_USER=${rabbitmq_user}",
                "RABBITMQ_DEFAULT_PASS=${rabbitmq_password}",
              ],
  }


}

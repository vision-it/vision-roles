# Role for Docker and Apt Repository
#
class vision_roles::repository (

  String $rabbitmq_user     = hiera('rabbitmq_user'),
  String $rabbitmq_password = hiera('rabbitmq_password'),

) {

  contain ::vision_aptcacher
  contain ::vision_aptly
  contain ::vision_docker
  contain ::vision_registry
  contain ::vision_webhookd

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

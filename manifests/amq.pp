# Role for Active Message Queue Protocol (RabbitMQ)

class vision_roles::amq (
  String $user = hiera('amp::user'),
  String $password = hiera('amp::password')
  ) {

  contain ::vision_docker

  ::docker::image { 'rabbitmq':
    ensure    => present,
    image     => 'rabbitmq',
    image_tag => '3',
  }
  ::docker::run { 'rabbitmq':
    ensure => present,
    image  => 'rabbitmq:3',
    ports  => [ '5672:5672' ],
    env    => [
                "RABBITMQ_DEFAULT_USER=${user}",
                "RABBITMQ_DEFAULT_PASS=${password}",
              ],
  }

}

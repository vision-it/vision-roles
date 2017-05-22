# Role for Webshop with Docker
#
class vision_roles::webshop (

  String $mysql_user      = hiera('webshop::database::user'),
  String $mysql_password  = hiera('webshop::database::password'),
  String $mysql_database  = hiera('webshop::database::name'),
  String $backup_password = hiera('database::backup::password'),

) {

  contain ::vision_docker

  class { '::vision_mysql::server':
    backup => {
      databases => [$mysql_database],
      password  => $backup_password,
    }
  }
  -> ::mysql::db { $mysql_database:
    user     => $mysql_user,
    password => $mysql_password,
    host     => '%',
    grant    => [ 'SELECT', 'UPDATE', 'CREATE', 'INSERT', 'ALTER', 'DELETE', 'DROP' ],
  }

  ::docker::image { 'webshop':
    ensure    => present,
    image     => 'vision.fraunhofer.de/webshop',
    image_tag => 'production',
  }

  ::docker::run { 'webshop':
    image   => 'vision.fraunhofer.de/webshop:production',
    env     => [
      "DB_HOST=${::fqdn}",
      'DB_PORT=3306',
      "DB_DATABASE=${mysql_database}",
      "DB_USERNAME=${mysql_user}",
      "DB_PASSWORD=${mysql_password}",
    ],
    ports   => [ '80:80' ],
    volumes => ['/opt/webshop/resources:/opt/app/resources', '/opt/webshop/logs:/opt/app/logs']
  }

}

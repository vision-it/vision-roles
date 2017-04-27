# Role for Legacy Mitarbeiterlog
#
class vision_roles::mitarbeiterlog (

  String $mysql_user          = hiera('mitarbeiterlog::database::user'),
  String $mysql_pass          = hiera('mitarbeiterlog::database::password'),
  String $mysql_db            = hiera('mitarbeiterlog::database::name'),
  String $path                = hiera('mitarbeiterlog::rootdir'),
  String $username            = 'mbl'

) {

  contain ::vision_mysql::server
  contain ::vision_apache::server

  file { 'Mitarbeiterlog root':
    ensure => directory,
    path   => $path,
    owner  => $username,
    group  => $username,
  }
  # opolkams: vision modules was moved to legacy, hopefully we dont need to deploy this anymore
  # -> file { "${path}/dbconfig.inc.php":
  #   ensure  => present,
  #   owner   => $username,
  #   group   => $username,
  #   mode    => '0660',
  #   content => template('vision/mitarbeiterlog/dbconfig.inc.php.erb'),
  # }

  ::mysql::db { $mysql_db:
    user     => $mysql_user,
    password => $mysql_pass,
    host     => '%',
    grant    => ['SELECT', 'UPDATE', 'CREATE', 'INSERT', 'ALTER', 'DELETE', 'DROP'],
  }

}

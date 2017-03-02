# Role for Mitarbeiterlog
#
class vision_roles::mitarbeiterlog(

  String $mysql_user          = hiera('mitarbeiterlog::database::user'),
  String $mysql_pass          = hiera('mitarbeiterlog::database::password'),
  String $mysql_db            = hiera('mitarbeiterlog::database::name'),
  String $deploy_key_public   = hiera('mitarbeiterlog::deploy::public'),
  String $deploy_key_private  = hiera('mitarbeiterlog::deploy::private'),
  String $path                = hiera('mitarbeiterlog::rootdir'),
  String $url                 = 'ssh://git@vision-ha.iis.fhg.de:2222/vision/mitarbeiterlog.git',
  String $username            = 'mbl'

) {

  contain vision::profile::backup::client

  contain ::vision_mysql::server
  contain ::vision_apache::server

  ::vision_deployment::user { $username:
    ssh_private_key => $deploy_key_private,
    ssh_public_key  => $deploy_key_public
  }->
  file { 'Mitarbeiterlog root':
    ensure => directory,
    path   => $path,
    owner  => $username,
    group  => $username,
  }->
  vcsrepo { $path:
    ensure   => present,
    provider => git,
    source   => $url,
    revision => 'master',
    user     => $username,
    force    => true,
    require  => User[$username],
  }->
  file { "${path}/dbconfig.inc.php":
    ensure  => present,
    owner   => $username,
    group   => $username,
    mode    => '0660',
    content => template('vision/mitarbeiterlog/dbconfig.inc.php.erb'),
  }

  ::mysql::db { $mysql_db:
    user     => $mysql_user,
    password => $mysql_pass,
    host     => '%',
    grant    => ['SELECT', 'UPDATE', 'CREATE', 'INSERT', 'ALTER', 'DELETE', 'DROP'],
  }

}

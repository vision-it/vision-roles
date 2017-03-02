# Role for Personenpflege SQL Server
#
class vision_roles::personenpflege {

  contain ::vision_mysql::server

  # Legacy
  contain vision::profile::backup::client

}

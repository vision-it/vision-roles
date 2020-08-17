# Backend Role
#

class vision_roles::backend {

  # Base
  contain vision_base

  # Servers
  contain vision_hashicorp::consul::server
  contain vision_hashicorp::nomad::server
  contain vision_mysql::server
  contain vision_gluster::server

  # Clients
  contain vision_loki::client
  contain vision_prometheus::client

  Class['vision_hashicorp::consul::server']
  -> Class['vision_mysql::server']
  -> Class['vision_gluster::server']

}

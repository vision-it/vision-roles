# Backend Role
#

class vision_roles::backend {

  # Base
  contain vision_base

  # Clients
  contain vision_loki::client
  contain vision_prometheus::client

  # Servers
  contain vision_hashicorp::consul::server
  contain vision_hashicorp::nomad::server
  contain vision_mysql::server
  contain vision_gluster::server

}

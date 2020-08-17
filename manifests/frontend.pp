# Frontend Role
#

class vision_roles::frontend {

  # Base
  contain vision_base

  # Clients
  contain vision_hashicorp::consul::client
  contain vision_hashicorp::nomad::client
  contain vision_gluster::client
  contain vision_mysql::client
  contain vision_loki::client
  contain vision_prometheus::client

  Class['vision_hashicorp::consul::client']
  -> Class['vision_gluster::client']
  -> Class['vision_mysql::client']

}

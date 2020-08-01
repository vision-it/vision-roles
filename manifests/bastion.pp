# Bastion Role
#

class vision_roles::bastion {

  # Base
  contain vision_base

  # Clients
  contain vision_hashicorp::consul::client

  # Servers
  contain vision_loki::server
  contain vision_prometheus::server

}

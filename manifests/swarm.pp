# Role for internal Swarm/MySQL "Cluster"
#
class vision_roles::swarm {

  contain ::vision_mysql::mariadb
  contain ::vision_docker
  contain ::vision_docker::swarm

  contain ::vision_traefik
  contain ::vision_mbl

  # staging
  contain ::vision_webshop
  contain ::vision_intranet

  $compose = [
    '/vision/data/swarm/traefik.yaml',
    '/vision/data/swarm/mitarbeiterlog.yaml',
    '/vision/data/swarm/webshop.yaml',
    '/vision/data/swarm/intranet.yaml',
  ]

  docker_stack { 'vision':
    ensure        => present,
    compose_files => $compose,
    require       => File[$compose],
  }

}

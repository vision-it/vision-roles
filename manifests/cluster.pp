# Role for new Swarm/MySQL/Gluster Cluster
#
class vision_roles::cluster {

  contain ::vision_mysql::mariadb
  contain ::vision_docker
  contain ::vision_docker::swarm
  contain ::vision_gluster::node

  contain ::vision_traefik

  $compose = [
    '/vision/data/swarm/traefik.yaml',
    '/vision/data/swarm/minio.yaml',
  ]

  docker_stack { 'vision':
    ensure        => present,
    compose_files => $compose,
    require       => File[$compose],
  }

}

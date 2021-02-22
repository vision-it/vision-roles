# Role for new Legacy Cluster
# with disabled MySQL/Gluster Profiles, so that the production branches can be migrated
#
class vision_roles::cluster {

  # contain ::vision_mysql::mariadb
  contain ::vision_docker
  contain ::vision_docker::swarm
  # contain ::vision_gluster::node
  contain ::vision_keepalived

  contain ::vision_traefik
  contain ::vision_webshop
  contain ::vision_freeipa::master
  contain ::vision_intranet
  contain ::vision_personenpflege

  $compose = [
    '/vision/data/swarm/traefik.yaml',
    '/vision/data/swarm/webshop.yaml',
    '/vision/data/swarm/freeipa-master.yaml',
    '/vision/data/swarm/intranet.yaml',
    '/vision/data/swarm/personenpflege.yaml',
  ]

  docker_stack { 'vision':
    ensure        => present,
    compose_files => $compose,
    up_args       => '--with-registry-auth',
    require       => File[$compose],
  }

}

# Role for new Swarm/MySQL/Gluster Cluster
#
class vision_roles::cluster {

  contain ::vision_mysql::mariadb
  contain ::vision_docker
  contain ::vision_docker::swarm
  contain ::vision_gluster::node

  contain ::vision_traefik
  contain ::vision_minio
  contain ::vision_puppetdb
  contain ::vision_limesurvey
  contain ::vision_piwik
  contain ::vision_webshop

  $compose = [
    '/vision/data/swarm/traefik.yaml',
    '/vision/data/swarm/minio.yaml',
    '/vision/data/swarm/puppetdb.yaml',
    '/vision/data/swarm/limesurvey.yaml',
    '/vision/data/swarm/matomo.yaml',
    '/vision/data/swarm/webshop.yaml',
  ]

  docker_stack { 'vision':
    ensure        => present,
    compose_files => $compose,
    require       => File[$compose],
  }

}

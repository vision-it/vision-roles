# Role for new Swarm/MySQL/Gluster Cluster
#
class vision_roles::cluster {

  contain ::vision_mysql::mariadb
  contain ::vision_prometheus::exporter::mysql
  contain ::vision_docker
  contain ::vision_docker::swarm
  contain ::vision_gluster::node
  contain ::vision_keepalived

  contain ::vision_traefik
  contain ::vision_limesurvey
  contain ::vision_piwik
  contain ::vision_webshop
  contain ::vision_freeipa::master
  contain ::vision_intranet
  contain ::vision_personenpflege

  $compose = [
    '/vision/data/swarm/traefik.yaml',
    '/vision/data/swarm/limesurvey.yaml',
    '/vision/data/swarm/matomo.yaml',
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

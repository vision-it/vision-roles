# Role for new Swarm/MySQL/Gluster Cluster
#
class vision_roles::cluster {

  contain ::vision_mysql::mariadb
  contain ::vision_docker
  contain ::vision_docker::swarm

}

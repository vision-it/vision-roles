# Role for new Swarm/MySQL/Gluster Cluster
#
class vision_roles::cluster {

  contain ::vision_mysql::mariadb

}

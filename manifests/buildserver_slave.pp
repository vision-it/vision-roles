# Role for Jenkins Buildserver Slave.
#
class vision_roles::buildserver_slave {

  contain ::vision_jenkins::user
  contain ::vision_jenkins::jdk

}

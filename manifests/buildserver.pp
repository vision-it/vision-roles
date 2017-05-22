# Role for Jenkins Buildserver.
#
class vision_roles::buildserver {

  contain ::vision_jenkins::master

}

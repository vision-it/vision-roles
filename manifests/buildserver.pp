# Role for Jenkins Buildserver.
#
class vision_roles::buildserver {

  contain ::vision_jenkins
  contain ::vision_docker
  contain ::vision_nodejs
  contain ::vision_hubot

}

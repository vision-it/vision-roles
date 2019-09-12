# Role for Desktops
#
class vision_roles::desktop {

  contain ::vision_docker
  contain ::vision_editors::phpstorm
  contain ::vision_idm
  contain ::vision_nfs
  contain ::vision_nodejs
  contain ::vision_ssh::client

}

# Role for Gitlab
#
class vision_roles::gitlab {

  contain ::vision_gitlab
  contain ::vision_nodejs

}

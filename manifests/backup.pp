# Role for primary Backup server
#
class vision_roles::backup {

  contain ::vision_groups
  contain ::vision_logcheck

}

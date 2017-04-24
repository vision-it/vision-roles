# Role for Backup server
#
class vision_roles::backup {

  contain ::vision_bareos
  contain ::vision_rsync
  contain ::vision_redalert

}

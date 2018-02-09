# Role for Mitarbeiterlog
#
class vision_roles::mitarbeiterlog {

  contain ::vision_mbl
  contain ::vision_jenkins::user

}

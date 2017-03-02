# Role for phpmyadmin Server
#
class vision_roles::phpmyadmin {

  contain ::vision_phpmyadmin

  # Legacy
  contain vision::profile::backup::client

}

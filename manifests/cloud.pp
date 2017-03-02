# Role for NextCloud Instance.
#
class vision_roles::cloud {

  contain ::vision_nextcloud

  # Legacy
  contain vision::profile::backup::client

}

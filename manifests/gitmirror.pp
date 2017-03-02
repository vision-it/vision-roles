# Role for Git Mirror
#
class vision_roles::gitmirror {

  contain ::vision_gogs

  # Legacy
  contain vision::profile::backup::client

}

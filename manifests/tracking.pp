# Role for Website Tracking
#
class vision_roles::tracking {

  contain ::vision_piwik

  # Legacy
  contain vision::profile::backup::client

}

# Role for Limesurvey Server
#
class vision_roles::limesurvey {

  contain ::vision_limesurvey

  # Legacy
  contain vision::profile::backup::client

}

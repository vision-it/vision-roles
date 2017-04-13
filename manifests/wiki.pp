# Role for MediaWiki
#
class vision_roles::wiki {

  contain ::vision_mysql::server
  contain ::vision_apache::server

  # Legacy
  contain vision::profile::mediawiki::base

}

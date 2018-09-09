# Role for Webproxy
#
class vision_roles::proxy {

  # temporary during migration -- henschjk 2018-08-31
  package { [
             'apache2',
             'apache2-bin',
             'apache2-data',
             'apache2-utils',
             ]:
               ensure => 'absent',
  }
  service { 'apache2':
    ensure => 'stopped',
  }

  contain ::vision_nginx

}

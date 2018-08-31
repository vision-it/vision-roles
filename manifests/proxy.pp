# Role for Webproxy
#
class vision_roles::proxy {

  # temporary during migration -- henschjk 2018-08-31
  if $::fqdn == 'prx01.prd.int.vision.fhg.de' {
    package { [
      'apache2',
      'apache2-bin',
      'apache2-data',
      'apache2-utils',
    ]:
      ensure => 'absent',
    }
    contain ::vision_nginx
  } else {
    contain ::vision_apache
  }

}

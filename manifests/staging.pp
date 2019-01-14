# Role for Intranet & Webshop Staging

class vision_roles::staging {

  contain ::vision_intranet
  contain ::vision_webshop
  contain ::vision_ssh::client

  ::docker::image { 'mailhog':
    ensure => present,
    image  => 'mailhog/mailhog',
  }

  ::docker::run { 'mailhog':
    image   => 'mailhog/mailhog',
    ports   => [
      '1025:1025',
      '8025:8025',
    ],
    env     => [
      'MH_UI_WEB_PATH=mailhog', # sets base url
    ],
    require => Docker::Image['mailhog'],
  }

}

# Role for Intranet & Webshop Staging

class vision_roles::staging {

  contain ::vision_intranet
  contain ::vision_webshop
  contain ::vision_ssh::client

}

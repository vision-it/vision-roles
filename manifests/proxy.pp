# Role for Webproxy
#
class vision_roles::proxy {

  contain ::vision_apache::proxy
  contain ::vision_apache::ssl

}

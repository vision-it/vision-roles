# Role for Desktops
#
class vision_roles::desktop {

  contain ::vision_cups
  contain ::vision_docker
  contain ::vision_editors::phpstorm
  contain ::vision_kerberos::client
  contain ::vision_ldap::client
  contain ::vision_nfs::client
  contain ::vision_nodejs
  contain ::vision_packer

}

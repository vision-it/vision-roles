# Role for Desktops
#
class roles::desktop {

  contain ::vision_apt::unattended_upgrades
  contain ::vision_cups
  contain ::vision_docker
  contain ::vision_editors::intellij_idea
  contain ::vision_editors::phpstorm
  contain ::vision_kerberos::client
  contain ::vision_ldap::client
  contain ::vision_nfs::client
  contain ::vision_nodejs
  contain ::vision_packer
  contain ::vision_puppet::client
  contain ::vision_sudo

}

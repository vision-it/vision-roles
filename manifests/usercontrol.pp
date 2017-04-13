# Role for LDAP and Kerberos
#
class vision_roles::usercontrol {

  contain ::vision_kerberos::master
  contain ::vision_ldap::server

}

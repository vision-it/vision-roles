# Role for Backup server
#
class vision_roles::backup {

  contain ::vision_bareos
  contain ::vision_rsync
  contain ::vision_redalert

  contain ::vision_docker
  ::docker::image { 'registry-ui':
    ensure    => present,
    image     => 'evedel/bow',
    image_tag => 'latest',
  }

  # data can be fetched any time from docker registry again
  # no need for backup
  file { '/var/lib/bow':
    ensure => 'directory',
  }
  -> ::docker::run { 'registry-ui':
    ensure           => present,
    image            => 'evedel/bow:latest',
    ports            => [ '5001:19808'],
    env              => [
                         'BS_LOG_SILENT=yes',
                         ],
    volumes          => [
                         '/var/lib/bow:/var/lib/bow:rw',
                         ],
    extra_parameters => [
                         '--read-only=true',
                         ],
  }


}

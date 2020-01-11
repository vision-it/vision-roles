# Role for internal Swarm/MySQL "Cluster"
#
class vision_roles::swarm {

  contain ::vision_mysql::mariadb
  contain ::vision_docker
  contain ::vision_docker::swarm

  contain ::vision_traefik
  contain ::vision_mbl

  # staging
  contain ::vision_personenpflege
  contain ::vision_webshop
  contain ::vision_intranet
  contain ::vision_ssh::client

  # mailhog setup (should this have its own module?)
  $compose_hog = {
    'version' => '3.7',
    'services' => {
      'mailhog' => {
        'image'       => 'visionit/mailhog:latest',
        'environment' => [
          'MH_UI_WEB_PATH=mailhog', # sets base url
                          ],
        'deploy' => {
          'labels' => [
            'traefik.port=8025',
            'traefik.frontend.rule=PathPrefix:/mailhog',
            'traefik.enable=true',
          ],
        }
      }
    }
  }

  vision_docker::to_compose { 'mailhog':
    compose => $compose_hog,
  }

  $compose = [
    '/vision/data/swarm/traefik.yaml',
    '/vision/data/swarm/mitarbeiterlog.yaml',
    '/vision/data/swarm/webshop.yaml',
    '/vision/data/swarm/mailhog.yaml',
    '/vision/data/swarm/intranet.yaml',
    '/vision/data/swarm/personenpflege.yaml',
  ]

  docker_stack { 'vision':
    ensure        => present,
    compose_files => $compose,
    up_args       => '--with-registry-auth',
    require       => File[$compose],
  }

}

require 'puppet'
require 'beaker-rspec'
require 'yaml'

install_puppet_agent_on hosts, {}

def copy_hiera_files_to(host, opts = {})
  scp_to host, opts[:hiera_yaml], opts[:target] + '/hiera.yaml'
end

RSpec.configure do |c|
  # Module root and settings
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  module_name = module_root.split('/').last.sub('-', '_')
  c.formatter = :documentation
  c.max_displayed_failure_line_count = 5

  c.before :suite do
    # Install module and dependencies
    puppet_module_install(source: module_root, module_name: module_name)
    modules_fixtures = YAML.load_file(module_root + '/.fixtures.yml')
    modules = modules_fixtures['fixtures']['repositories']

    hosts.each do |host|
      # Install Hiera
      copy_hiera_files_to(host,
                          hiera_yaml: module_root + '/spec/hiera/hiera.yaml.beaker',
                          target: '/etc/puppetlabs/code/modules/' + module_name + '/')

      # Install fixture modules
      modules.each do |_name, mod_url|
        mod_name = mod_url.split('/').last
        on host, puppet('module', 'install', mod_name), acceptable_exit_codes: [0, 1]
      end
    end
  end
end

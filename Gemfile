source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? ENV['PUPPET_VERSION'] : ['4.10']
gem 'puppet', puppetversion

gem 'puppetlabs_spec_helper', '1.2.2'
gem 'rake', '11.3.0'
gem 'rspec-puppet', '2.5.0'

group :rubocop do
  gem 'rubocop', '0.47.0'
  gem 'rubocop-rspec', '1.10.0'
end

group :testing do
  gem 'metadata-json-lint', '1.1.0'
  gem 'rspec-puppet-facts', '1.7.1'
end

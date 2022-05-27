require_relative 'lib/mitake_api/version'

Gem::Specification.new do |spec|
  spec.name        = 'mitake_api'
  spec.version     = MitakeApi::VERSION
  spec.authors     = ['Arthur Li']
  spec.email       = ['z22919456@gmail.com']
  spec.homepage    = 'http://github.com/z22919456/mitake_api'
  spec.summary     = 'Mitake Api SMS for Ruby on Rails'
  spec.description = 'Mitake Api SMS for Ruby on Rails'
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'action_message_texter', '~> 0.0.0'
  spec.add_dependency 'faraday', '~> 2.3.0'
  spec.add_dependency 'rails', '>= 5.0.0'
end

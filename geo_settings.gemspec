Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'geo_settings'
  s.version     = '0.30.0.beta'
  s.summary     = 'Restrict orders to local area for spree.'
  s.description = 'Restrict orders to local area for spree.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Peter Zlatnar'
  s.email             = 'peter.zlatnar@gmail.com'
  s.homepage          = 'http://github.com/peterz/spree-geo-settings'
  # s.rubyforge_project = 'actionmailer'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.30.0.beta2')
  s.add_dependency('geokit', '~> 1.5.0')
  s.add_dependency('slim', '~> 0.7.0')
  s.add_dependency('yajl-ruby', '~> 0.7.8')
  s.add_dependency('httparty', '~> 0.6.1')
end
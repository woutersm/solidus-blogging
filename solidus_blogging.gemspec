# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_blogging'
  s.version     = '1.0.0'
  s.summary     = 'BloggingSolidus: A Solidus blogging solution'
  s.description = 'A basic blogging solution for use with the Solidus E-Commerce platform.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Dan Mitchell'
  s.email     = 'dan@digitalreflow.co.uk'
  s.homepage  = 'http://www.digitalreflow.co.uk'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'solidus', '> 1.0'
  s.add_dependency 'deface', '~> 1.0.2'
  s.add_dependency 'solidus_auth_devise', '~> 1.5'
  s.add_dependency 'acts-as-taggable-on', '~> 3.0.2'

  s.add_development_dependency 'capybara', '~> 2.7'
  s.add_development_dependency 'coffee-rails', '~> 4.0.0'
  s.add_development_dependency 'database_cleaner', '1.2.0'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~> 3'
  s.add_development_dependency 'sass-rails', '~> 5.0.0'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'launchy'

end

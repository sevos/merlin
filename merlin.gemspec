$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "merlin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "merlin"
  s.version     = Merlin::VERSION
  s.authors     = ["Artur Roszczyk"]
  s.email       = ["artur.roszczyk@gmail.com"]
  s.homepage    = "http://github.com/sevos/merlin"
  s.summary     = "App configuration made simple"
  s.description = "Client for merlin-server"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'capybara'
end

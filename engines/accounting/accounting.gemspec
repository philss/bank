$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "accounting/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "accounting"
  s.version     = Accounting::VERSION
  s.authors     = ["Philip Sampaio"]
  s.email       = ["philip.sampaio@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Accounting."
  s.description = "TODO: Description of Accounting."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
end

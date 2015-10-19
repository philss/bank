$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "credit_report/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "credit_report"
  s.version     = CreditReport::VERSION
  s.authors     = ["Philip Sampaio"]
  s.email       = ["philip.sampaio@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CreditReport."
  s.description = "TODO: Description of CreditReport."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end

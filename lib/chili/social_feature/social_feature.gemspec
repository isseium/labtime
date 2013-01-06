$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "social_feature/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "social_feature"
  s.version     = SocialFeature::VERSION
  s.authors     = ["whtiech0c0"]
  s.email       = ["hirotonbuu@gmai.com"]
  s.homepage    = ""
  s.summary     = "Summary of SocialFeature."
  s.description = "Description of SocialFeature."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency 'chili', '~> 3.0'

  s.add_development_dependency "sqlite3"
end

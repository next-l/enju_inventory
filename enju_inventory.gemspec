$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_inventory/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_inventory"
  s.version     = EnjuInventory::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "https://github.com/next-l/enju_inventory"
  s.summary     = "enju_inventory plugin"
  s.description = "Inventory management for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/log/*"] - Dir["spec/dummy/solr/{data,pids,default,development,test}/*"] - Dir["spec/dummy/tmp/*"]

  s.add_dependency "enju_biblio", "~> 0.2.0.beta.2"

  s.add_development_dependency "enju_leaf", "~> 1.2.0.beta.2"
  s.add_development_dependency "globalize"
  s.add_development_dependency "globalize-accessors"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "mysql2"
  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 3.4"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "annotate"
  s.add_development_dependency "coveralls"
end

# -*- encoding: utf-8 -*-
require File.expand_path('../lib/work/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Cary FitzHugh"]
  gem.email         = ["cary.fitzhugh@ziplist.com"]
  gem.description   = %q{Workflow management for github and pivotal and ziplist}
  gem.summary       = %q{Workflow management for github and pivotal and ziplist}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "work"
  gem.require_paths = ["lib"]
  gem.version       = Work::VERSION

  gem.add_development_dependency "pry"
  gem.add_runtime_dependency     "pivotal-tracker"
  gem.add_runtime_dependency     "system_timer"
  gem.add_runtime_dependency     "github_api"
end

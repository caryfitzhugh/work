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

  gems = ['pivotal-tracker', 'pry']
  gem.add_development_dependency *gems
  gem.add_runtime_dependency     *gems
end

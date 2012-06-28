# -*- encoding: utf-8 -*-
require File.expand_path('../lib/walkscore/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["michael verdi"]
  gem.email         = ["michael.v.verdi@gmail.com"]
  gem.description   = %q{Wrapper for the Walkscore Api}
  gem.summary       = %q{Wrapper for the Walkscore Api}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "walkscore"
  gem.require_paths = ["lib"]
  gem.version       = Walkscore::VERSION

  gem.add_runtime_dependency('faraday')
  gem.add_development_dependency('rspec')
end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'puff/version'

Gem::Specification.new do |gem|
  gem.name          = "puff"
  gem.version       = Puff::VERSION
  gem.authors       = ["Richard Lee"]
  gem.email         = ["rl@polydice.com"]
  gem.description   = %q{Puff provides Redis instrumentation for Rails.}
  gem.summary       = %q{Elagant Redis solution for Rails.}
  gem.homepage      = "https://github.com/polydice/puff"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "railties", "~> 4"
  gem.add_dependency "activesupport", "~> 4"
  gem.add_dependency "redis", "~> 3.0"

  gem.add_development_dependency "rake",  "~> 10.0"
end

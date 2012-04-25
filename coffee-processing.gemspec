# -*- encoding: utf-8 -*-
require File.expand_path('../lib/coffee-processing/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Junegunn Choi"]
  gem.email         = ["junegunn.c@gmail.com"]
  gem.description   = %q{Write Processing.js sketches in Coffeescript}
  gem.summary       = %q{Write Processing.js sketches in Coffeescript}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "coffee-processing"
  gem.require_paths = ["lib"]
  gem.version       = CoffeeProcessing::VERSION

  gem.add_runtime_dependency 'coffee-script', '~> 2.2.0'
  gem.add_runtime_dependency 'erubis', '~> 2.7.0'
  gem.add_development_dependency 'test-unit', '~> 2.4.8'
end

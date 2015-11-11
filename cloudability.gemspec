# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudability/version'

Gem::Specification.new do |gem|
  gem.name          = "cloudability"
  gem.version       = Cloudability::VERSION
  gem.licenses      = ['MIT']
  gem.authors       = ["Colby Aley", "Aaron Bento"]
  gem.email         = ["colby@cloudability.com", "abento+github@gmail.com"]
  gem.description   = %q{Ruby wrapper for the Cloudability API}
  gem.summary       = %q{Ruby wrapper for the Cloudability API built with HTTParty}
  gem.homepage      = "https://github.com/cp/cloudability"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('httparty', ">= 0.9.0")
  gem.add_dependency('hashie')

  gem.add_development_dependency('rspec')
  gem.add_development_dependency('fakeweb')
  gem.add_development_dependency('rake', '~> 0.6')
  gem.add_development_dependency('coveralls')
  gem.add_development_dependency('pry')
end

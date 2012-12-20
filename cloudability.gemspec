# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudability/version'

Gem::Specification.new do |gem|
  gem.name          = "cloudability"
  gem.version       = Cloudability::VERSION
  gem.authors       = ["Aaron Bento"]
  gem.email         = ["abento+github@gmail.com"]
  gem.description   = %q{Ruby wrapper for the Cloudability API}
  gem.summary       = %q{Ruby wrapper for the Cloudability API using httparty}
  gem.homepage      = "https://github.com/rkive/cloudability"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('httparty', "~> 0.9.0")
  gem.add_dependency('mash', "~> 0.1.1")

  gem.add_development_dependency("turn", "~> 2.0.1")
  gem.add_development_dependency("rake", "~> 0.6")
  gem.add_development_dependency("shoulda", "~> 3.3.2")
  gem.add_development_dependency("fakeweb", "~> 1.3.0")
  gem.add_development_dependency("jnunemaker-matchy", "~> 0.4.0")
end

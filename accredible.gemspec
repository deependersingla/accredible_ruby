# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'accredible/version'

Gem::Specification.new do |spec|
  spec.name          = "accredible"
  spec.version       = Accredible::VERSION
  spec.authors       = ["Deepender Singla"]
  spec.email         = ['deepender281190@gmail.com']
  spec.summary       = %q{Ruby Bindings for Accredible certificate}
  spec.description   = %q{Accredible is the best way to generate online learning certificates. www.accredible.com/example}
  spec.homepage      = "https://github.com/accredible/accredible_ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "coveralls"
  spec.add_dependency 'json', '~> 1.8.1'
  spec.add_dependency 'multipart-post'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'containers_manager/version'

Gem::Specification.new do |spec|
  spec.name          = "containers_manager"
  spec.version       = ContainersManager::VERSION
  spec.authors       = ["Duc Le"]
  spec.email         = ["leminhducktvn@gmail.com"]

  spec.summary       = %q{A tool for managing docker containers in a docker swarm}
  spec.description   = %q{A tool for managing docker containers in a docker swarm}
  spec.homepage      = "https://github.com/RingMD/containers_manager"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["dmanage"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'thor', '~> 0.19.1'
end

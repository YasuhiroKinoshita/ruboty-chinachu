# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/chinachu/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-chinachu"
  spec.version       = Ruboty::Chinachu::VERSION
  spec.authors       = ["Kinoshita.Yasuhiro"]
  spec.email         = ["WhoIsDissolvedGirl+github@gmail.com"]

  spec.summary       = %q{Ruboty plugin work with Chinachu server}
  spec.description   = %q{Ruboty plugin work with Chinachu server}
  spec.homepage      = "https://github.com/YasuhiroKinoshita/ruboty-chinachu"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ruboty", "~> 1.2"
  spec.add_runtime_dependency "goraku", "~> 0.1.2"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "wtfpl_init"
end

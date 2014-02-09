# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rvnstat/version'

Gem::Specification.new do |spec|
  spec.name          = "rvnstat"
  spec.version       = Rvnstat::VERSION
  spec.authors       = ["Doug Bishop"]
  spec.email         = ["doug@dougbishop.org"]
  spec.description   = %q{Sinatra GUI for vnstat}
  spec.summary       = %q{Sinatra + ruby + vnstat = coolness}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "unicorn"
  spec.add_runtime_dependency "sinatra"
  spec.add_runtime_dependency "chartkick"
  spec.add_runtime_dependency "vidibus-sysinfo"
end

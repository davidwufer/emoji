# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emoji/version'

Gem::Specification.new do |spec|
  spec.name          = "emoji"
  spec.version       = Emoji::VERSION
  spec.authors       = ["David Wu"]
  spec.email         = ["davidcnwu@gmail.com"]
  spec.summary       = %q{An Emoji Menu}
  spec.description   = %q{An emoji menu for quick clipboard copying}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables   = ["emoji"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "trollop", "2.0"
end

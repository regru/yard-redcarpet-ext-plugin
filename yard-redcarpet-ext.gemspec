# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yard/redcarpet/ext/version'

Gem::Specification.new do |spec|
  spec.name          = "yard-redcarpet-ext"
  spec.version       = YARD::Redcarpet::Ext::VERSION.dup
  spec.authors       = ["Akzhan Abdulin"]
  spec.email         = ["akzhan.abdulin@gmail.com"]
  spec.description   = %q{Redcarpet extensions for YARD}
  spec.summary       = %q{Enable Redcarpet extensions for YARD projects}
  spec.homepage      = "https://github.com/regru/yard-redcarpet-ext-plugin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.has_rdoc      = 'yard'

  spec.add_runtime_dependency "yard", "~> 0.8.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

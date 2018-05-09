# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby/cmd/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-cmd"
  spec.version       = Ruby::Cmd::VERSION
  spec.authors       = ["Jeeva"]
  spec.email         = ["anymsjeeva@gmail.com"]

  spec.summary       = %q{Cmd makes it easy to build slick CLIs with tab completion, command history, and built-in help inspired by Python cmd module}
  spec.homepage      = "https://github.com/codebrk/ruby-cmd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").push(*["lib/ruby/cmd/prompt.rb"]).reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

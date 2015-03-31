# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'totp/version'

Gem::Specification.new do |spec|
  spec.name          = "totp-simple"
  spec.version       = TOTP::VERSION
  spec.authors       = ["about:source"]
  spec.email         = ["support@aboutsource.net"]
  spec.summary       = %q{Generate and validate totp token, see RFC 6238}
  spec.description   = %q{Generate and validate totp token, see RFC 6238. Very simple implementation so far.}
  spec.homepage      = "https://github.com/aboutsource/totp-simple"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 3.1"
end

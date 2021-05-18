# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'challah/jwt/version'

Gem::Specification.new do |spec|
  spec.name          = "challah-jwt"
  spec.version       = Challah::Jwt::VERSION
  spec.authors       = ["Phillip Ridlen"]
  spec.email         = ["p@rdln.net"]

  spec.summary       = %q{Use JSON Web Tokens (JWT) to authenticate with Challah}
  spec.homepage      = "https://github.com/philtr/challah-jwt.git"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "challah", "~> 1.4"
  spec.add_dependency "jwt", "~> 1.5"

  spec.add_development_dependency "bundler", ">= 2.1.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
end

# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "role_call/version"

Gem::Specification.new do |spec|
  spec.name          = "role_call"
  spec.version       = RoleCall::VERSION
  spec.authors       = [ "Eric Garside" ]
  spec.email         = %w[garside@gmail.com]

  spec.summary       = "A simple and extensible approach to role-based access control management in Rails"
  spec.description   = "Describe the roles and permissions of your system with clear, testable, self-documenting code"
  spec.homepage      = "https://www.freshly.com/"
  spec.license       = "MIT"

  spec.files         = Dir["README.md", "LICENSE.txt", "lib/**/{*,.[a-z]*}"]
  spec.require_paths = "lib"

  spec.add_runtime_dependency "activesupport", "~> 5.2.1"
  spec.add_runtime_dependency "spicery", ">= 0.20.4", "< 1.0"

  spec.add_development_dependency "bundler", "~> 2.0.1"
  spec.add_development_dependency "pry-byebug", ">= 3.7.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "simplecov", "~> 0.16"
  spec.add_development_dependency "timecop", ">= 0.9.1"
  spec.add_development_dependency "shoulda-matchers", "4.0.1"

  spec.add_development_dependency "rspice", ">= 0.20.4", "< 1.0"
  spec.add_development_dependency "spicerack-styleguide", ">= 0.20.4", "< 1.0"
end

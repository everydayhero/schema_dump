# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "schema_dump/version"

Gem::Specification.new do |spec|
  spec.name          = "schema_dump"
  spec.version       = SchemaDump::VERSION
  spec.authors       = ["Tim Cooper"]
  spec.email         = ["coop@latrobest.com"]

  spec.summary       = "Export an database to an ActiveRecord::Schema format"
  spec.description   = spec.description
  spec.homepage      = "https://github.com/everydayhero/schema_dump"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "activerecord", "~> 4.2"
  spec.add_dependency "mysql2"
  spec.add_dependency "pg"
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "to_slug/version"

Gem::Specification.new do |s|
  s.name        = "to_slug"
  s.version     = ToSlug::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Eric Boehs"]
  s.email       = ["ericboehs@gmail.com"]
  s.homepage    = "https://github.com/ericboehs/to_slug"
  s.summary     = %q{Adds a to_slug method to ruby's String class}
  s.description = %q{This gem makes URL friendly strings out of not so pretty strings.}

  s.rubyforge_project = "to_slug"

  s.add_development_dependency "rspec", "~> 2.4.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pivotal-epic-tracker/version"

Gem::Specification.new do |s|
  s.name        = "pivotal-epic-tracker"
  s.version     = PivotalEpicTracker::VERSION
  s.authors     = ["Arif Bandali"]
  s.email       = ["hello@arifb.com"]
  s.homepage    = ""
  s.summary     = %q{A tool to give high-level visibility into features that are being built, and where in the dev cycle they are.}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "pivotal-epic-tracker"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "pivotal-tracker"
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pivotal-roadmap-tracker/version"

Gem::Specification.new do |s|
  s.name        = "pivotal-roadmap-tracker"
  s.version     = PivotalRoadmapTracker::VERSION
  s.authors     = ["Arif Bandali"]
  s.email       = ["hello@arifb.com"]
  s.homepage    = ""
  s.summary     = %q{A tool to give high-level visibility into features that are being built, and where in the dev cycle they are.}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "pivotal-roadmap-tracker"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "pivotal-tracker"
  #s.add_dependency(%q<bundler>, ["~> 1.0.12"])
end

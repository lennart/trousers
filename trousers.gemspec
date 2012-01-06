# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "trousers/version"

Gem::Specification.new do |s|
  s.name        = "trousers"
  s.version     = Trousers::VERSION
  s.authors     = ["Lennart Melzer"]
  s.email       = ["me@lmaa.name"]
  s.homepage    = ""
  s.summary     = %q{organize stuff that otherwise gets lost in the void}
  s.description = %q{Something that could _also_ be called a **Stickies App**,
    uses CouchDB for storage and thor as a CLI frontend
  }

  s.rubyforge_project = "trousers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "couchrest"
  s.add_runtime_dependency "thor"
end

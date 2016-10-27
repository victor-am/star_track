Gem::Specification.new do |s|
  s.name          = "star_track"
  s.version       = "0.1.0"
  s.authors       = ["victor-am"]
  s.summary       = "Because manual time tracking is for barbarians"
  s.homepage      = "https://github.com/victor-am/star_track"
  s.licenses      = "MIT"
  s.executables   = ["star_track"]
  s.require_paths = ["lib"]
  s.files         = Dir["lib/**/*", "bin/*"]

  s.add_dependency "wunderlist-api", "~> 1.1"
  s.add_dependency "freckles",       "~> 1.1"
  s.add_dependency "colorize",       "~> 0.8"

  s.add_development_dependency "pry", "~> 0"
end

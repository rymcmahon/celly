require_relative 'lib/celly/version'

Gem::Specification.new do |spec|
  spec.name          = "celly"
  spec.version       = Celly::VERSION
  spec.authors       = ["rymcmahon"]
  spec.email         = ["iamryan@hey.com"]

  spec.summary       = %q{Celly is a Ruby wrapper for the little-known, undocumented API for the National Hockey league.}
  spec.description   = %q{This gem provides an easy-to-use DSL for retrieving player and team statistics from the National Hockey League's API. Simple methods calls will give access to a player's regular-season or playoffs statistics by season or for an entire career, roster information for each team, league standings, and franchise data.}
  spec.homepage      = "https://github.com/rymcmahon/celly"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rymcmahon/celly"
  spec.metadata["changelog_uri"] = "https://github.com/rymcmahon/celly"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

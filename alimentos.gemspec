# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "alimentos/version"

Gem::Specification.new do |spec|
  spec.name          = "alimentos"
  spec.version       = Alimentos::VERSION
  spec.authors       = ["angehl"]
  spec.email         = ["alu0100881802@gmail.com"]

  spec.summary       = %q{Gema hecha para la práctica 6 de LPP}
  spec.description   = %q{Gema para represntar alimentos con sus contenidos calóricos}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1718/tdd-alu0100888102"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/ULL-ESIT-LPP-1718/tdd-alu0100888102"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

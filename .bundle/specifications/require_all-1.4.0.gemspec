# -*- encoding: utf-8 -*-
# stub: require_all 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "require_all".freeze
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jarmo Pertman".freeze, "Tony Arcieri".freeze]
  s.date = "2017-01-06"
  s.email = "jarmo.p@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze, "CHANGES".freeze]
  s.files = ["CHANGES".freeze, "LICENSE".freeze, "README.md".freeze]
  s.homepage = "http://github.com/jarmo/require_all".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--title".freeze, "require_all".freeze, "--main".freeze, "README.md".freeze, "--line-numbers".freeze]
  s.rubygems_version = "2.7.5".freeze
  s.summary = "A wonderfully simple way to load your code".freeze

  s.installed_by_version = "2.7.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.4"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.7"])
    else
      s.add_dependency(%q<rake>.freeze, ["~> 10.4"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<rake>.freeze, ["~> 10.4"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.7"])
  end
end

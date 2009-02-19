# -*- encoding: utf-8 -*-
require 'rake'

Gem::Specification.new do |s|
  s.name = %q{genem}
  s.version = "0.1.0"
  s.authors = ["Alessandro Baroni"]
  s.date = %q{2009-02-16}
  s.description = %q{Project creator for Ruby.}
  s.email = ["alexbaroni68@gmail.com"]
  s.executables = ["genem"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "README.txt"]
  s.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*', 'spec/**/*'].to_a
  s.has_rdoc = true
  s.homepage = %q{http://github.com/alexbaroni/genem/}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Genem is a tool for creating a ruby project that use RSpec and Cucumber for BDD}
end

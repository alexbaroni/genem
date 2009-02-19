require 'rubygems'
require 'rake'
Gem::manage_gems
require 'rake/gempackagetask'
require 'spec/rake/spectask'
require 'cucumber/rake/task'

gem_spec = Gem::Specification.new do |s|
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

desc "Generate gem"
Rake::GemPackageTask.new(gem_spec) do |pkg|
    pkg.need_zip = true
    pkg.need_tar = true
end

desc "Run all specs"
Spec::Rake::SpecTask.new(:specs) do |t|
	t.spec_opts = ["--color", "--format specdoc", "--diff"]
	t.ruby_opts = ["-W1"]
end

desc "Run all specs with RCov"
Spec::Rake::SpecTask.new(:specs_with_rcov) do |t|
	t.rcov = true
	t.rcov_opts = ['--exclude', 'spec']
end

desc "Run all specs with html output"
Spec::Rake::SpecTask.new(:specs_with_html) do |t|
	html = 'spec/specs.html'
	t.spec_opts = ["--color", "--format specdoc", "--format html:#{html}", "--diff"]
	t.ruby_opts = ["-W1"]
end

desc "Run all features"
Cucumber::Rake::Task.new(:features) do |t|
	t.cucumber_opts = "--format pretty --color"
end

desc "Run all features with RCov"
Cucumber::Rake::Task.new(:features_with_rcov) do |t|
	t.cucumber_opts = "--format pretty --color"
	t.rcov = true
end

desc "Run all features with html output"
Cucumber::Rake::Task.new(:features_with_html) do |t|
	html = 'features/features.html'
	t.cucumber_opts = "--format pretty --format html --out #{html} --color"
end
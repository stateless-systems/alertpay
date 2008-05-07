# -*- ruby -*-
require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/testtask'

NAME = 'alertpay'
VERS = '0.1'

CLEAN.include ['**/*.log', '*.gem']
CLOBBER.include ['**/*.log']

spec = Gem::Specification.new do |s|
  s.name             = NAME
  s.version          = VERS
  s.platform         = Gem::Platform::RUBY
  s.has_rdoc         = true
  s.extra_rdoc_files = ['README.txt']
  s.summary          = 'Common interface to alertpay request params.'
  s.description      = s.summary
  s.author           = 'Danial Pearce'
  s.email            = 'danial@statelesssystems.com'
  s.homepage         = 'http://statelesssystems.com'

  s.files            = FileList["{lib,test}/**/*"].to_a + %w(README.txt)
  s.test_files       = Dir['test/**/*_test.rb']
end

desc 'Default: Run unit tests.'
task :default => :test

Rake::GemPackageTask.new(spec) do |p|
    p.need_tar = true
    p.gem_spec = spec
end

desc 'Run the unit tests.'
Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Package and install as gem.'
task :install do
  sh %{rake package}
  sh %{sudo gem install pkg/#{NAME}-#{VERS}}
end

desc 'Uninstall the gem.'
task :uninstall => [:clean] do
  sh %{sudo gem uninstall #{NAME}}
end

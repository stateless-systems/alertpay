# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{alertpay}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Stateless Systems"]
  s.date = %q{2009-09-04}
  s.email = %q{enquiries@statelesssystems.com}
  s.extra_rdoc_files = [
    "README.txt"
  ]
  s.files = [
    "README.txt",
    "Rakefile",
    "VERSION.yml",
    "lib/alertpay.rb",
    "lib/helpers.rb",
    "lib/notification.rb",
    "test/notification_test.rb"
  ]
  s.homepage = %q{http://github.com/stateless-systems/alertpay}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Common interface to alertpay request params.}
  s.test_files = [
    "test/notification_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moode-haml-jqm/version'

Gem::Specification.new do |gem|
  gem.name          = "moode-haml-jqm"
  gem.version       = Moode::Haml::Jqm::VERSION
  gem.authors       = ["jtong, xudejian"]
  gem.email         = ["tj19832@gmail.com"]
  gem.description   = %q{jquery mobile based haml component}
  gem.summary       = %q{jquery mobile based haml component}
  gem.homepage      = "https://github.com/jtong/moode-haml-jqm"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

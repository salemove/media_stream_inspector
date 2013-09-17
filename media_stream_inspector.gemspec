# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'media_stream_inspector/version'

Gem::Specification.new do |spec|
  spec.name          = "media_stream_inspector"
  spec.version       = MediaStreamInspector::VERSION
  spec.authors       = ["Madis Nõmme"]
  spec.email         = ["madis.nomme@gmail.com"]
  spec.description   = %q{A tool providing Ruby API for inspecting HTML5 <video> element's stream. Also offers rspec matchers for acceptance testing (e.g. WebRTC video).}
  spec.summary       = %q{Provides ways to inspect and get information about streams attached to HTML5 <video> element.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

end

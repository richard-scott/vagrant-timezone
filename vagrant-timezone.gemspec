lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-timezone/version'

Gem::Specification.new do |spec|
  spec.name          = 'vagrant-timezone'
  spec.version       = VagrantPlugins::TimeZone::VERSION
  spec.description   = 'A Vagrant plugin that configures the time zone of a virtual machine'
  spec.summary       = spec.description
  spec.homepage      = 'http://github.com/tmatilai/vagrant-timezone'
  spec.license       = 'MIT'

  spec.authors = [
    'Teemu Matilainen',
    'Kyle Corbitt',
    'Robert R. Meyer'
  ]
  spec.email = [
    'teemu.matilainen@iki.fi',
    'kyle@corbt.com',
    'Blue.Dog.Archolite@gmail.com'
  ]

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
end

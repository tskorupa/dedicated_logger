# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name          = 'dedicated_logger'
  s.version       = '0.0.4'
  s.description   = 'Output formatter for the ruby Logger class'
  s.summary       = 'Standardize the logged output for background tasks and store it in a ' \
                    'dedicated file.'
  s.authors       = ['Tomasz Skorupa']
  s.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'
  s.add_development_dependency 'rake'
  s.add_dependency 'activesupport'
end

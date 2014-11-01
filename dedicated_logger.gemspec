# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
	s.name					= 'dedicated_logger'
	s.version				= '0.0.2'
	s.description		= %q{Output formatter for the ruby Logger class}
	s.summary				= %q{Standardize the logged output for background tasks and store it in a dedicated file}
	s.authors				= ['Tomasz Skorupa']
	s.files					= `git ls-files`.split($/)
	s.require_paths	= ['lib']
end

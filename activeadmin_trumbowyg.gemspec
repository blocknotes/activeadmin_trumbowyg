# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activeadmin/trumbowyg/version'

Gem::Specification.new do |spec|
  spec.name          = 'activeadmin_trumbowyg'
  spec.version       = ActiveAdmin::Trumbowyg::VERSION
  spec.summary       = 'Trumbowyg Editor for ActiveAdmin'
  spec.description   = 'An Active Admin plugin to use Trumbowyg Editor'
  spec.license       = 'MIT'
  spec.authors       = ['Mattia Roccoberton']
  spec.email         = 'mat@blocknot.es'
  spec.homepage      = 'https://github.com/blocknotes/activeadmin_trumbowyg'

  spec.required_ruby_version = '>= 3.0'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['changelog_uri']   = 'https://github.com/blocknotes/activeadmin_trumbowyg/blob/main/CHANGELOG.md'
  spec.metadata['source_code_uri'] = spec.homepage

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = Dir['{app,lib}/**/*', 'LICENSE.txt', 'Rakefile', 'README.md']
  spec.require_paths = ['lib']

  spec.add_dependency 'activeadmin', '>= 2.9.0'
end

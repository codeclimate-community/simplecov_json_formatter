# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'simplecov_json_formatter/version'

Gem::Specification.new 'simplecov_json_formatter' do |s|
  s.version     = SimpleCovJSONFormatter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Federico Moya']
  s.email       = ['federicomoyamartin@gmail.com']
  s.homepage    = 'https://github.com/fede-moya/simplecov_json_formatter'
  s.summary     = %(JSON formatter for SimpleCov)
  s.description = s.summary
  s.license = 'MIT'

  s.files         = Dir['{lib}/**/*.*', '*.md']
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.4.0'
end

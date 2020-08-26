$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'simplecov-json-formatter/version'

Gem::Specification.new 'simplecov-json-formatter' do |s|
  s.version     = SimpleCovJSONFormatter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Federico Moya']
  s.email       = ['federicomoyamartin@gmail.com']
  s.homepage    = 'https://github.com/fede-moya/simplecov-json-formatter'
  s.summary     = %Q{JSON formatter for SimpleCov}
  s.description = s.summary

  s.files         = Dir['{lib}/**/*.*', "*.md"]
  s.test_files    = Dir['{test}/**/*.*']
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.4.0'
  
  s.add_dependency 'simplecov', '~> 0.18', '>= 0.18.0'
  s.add_dependency 'json'
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'test-unit'
end

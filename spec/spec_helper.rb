# frozen_string_literal: true

require 'rspec'
require 'simplecov'
require 'simplecov_json_formatter'

SimpleCov.coverage_dir('tmp/coverage')

def source_fixture(filename)
  File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', filename))
end

def json_ouput
  JSON.parse(File.read('tmp/coverage/coverage.json'))
end

def json_result(filename)
  file = File.read(source_fixture("#{filename}.json"))
  JSON.parse(file)
end

# frozen_string_literal: true

require 'bundler/setup'
require 'rake/testtask'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  task :rubocop do
    warn 'Rubocop is disabled'
  end
end

task default: %i[rubocop spec]

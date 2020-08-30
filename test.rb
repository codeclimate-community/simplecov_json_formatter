# frozen_string_literal: true

require 'coverage'
Coverage.start(branches: true)
load '/gem/spec/fixtures/sample.rb'
foo = Foo.new
foo.bar
foo.foo(false)
puts Coverage.result

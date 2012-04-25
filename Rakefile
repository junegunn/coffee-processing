#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

desc 'Run tests'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = true
  t.warning = true
end


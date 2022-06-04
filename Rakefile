# frozen_string_literal: true

task default: %i[test execute]

desc 'Runs all the tests'
task :test do
  sh 'rspec spec/ -fd'
end

desc 'Executes the solution'
task :execute do
  sh 'ruby src/main.rb input.in'
end

require 'bundler/gem_tasks'

task :default => :spec
desc 'run Rspec specs'
task :spec do
  sh 'rspec'
end

task :irb do
  require File.expand_path('../lib/cloudability.rb', __FILE__)
  sh 'irb -r ./lib/cloudability.rb'
end

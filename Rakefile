require "bundler/gem_tasks"
require "rspec/core/rake_task"

task :default => :spec

desc "Ejecutar las espectativas de la clase Point"
task :spec do
  sh "rspec -I. spec/alimentos_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
  sh "rspec -I. spec/alimentos_spec.rb --format documentation"
end
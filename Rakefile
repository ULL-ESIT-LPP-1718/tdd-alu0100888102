require "bundler/gem_tasks"
require "rspec/core/rake_task"

task :default => :spec

desc "Ejecutar las espectativas de la clase Point"
task :spec do
  sh "rspec -I. spec/alimentos_spec.rb"
  sh "rspec -I. spec/lista_spec.rb"
  sh "rspec -I. spec/plato_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
  sh "rspec -I. spec/alimentos_spec.rb --format documentation"
  sh "rspec -I. spec/lista_spec.rb --format documentation"
  sh "rspec -I. spec/plato_spec.rb --format documentation"
end

desc "Hacer un push a nutrientes y a origin"
task :push do
  sh "git push origin master"
  sh "git push nutrientes master"
end

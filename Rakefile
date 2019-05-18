require 'rspec/core/rake_task'

task tests: [:spec]

desc 'Task para execução dos specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/*_spec.rb'
  t.verbose = false
  t.rspec_opts = '-f html --out reports/rspec_results.html -f documentation -r  ./spec/spec_helper.rb'
end

require 'rspec/core/rake_task'

task tests: [:spec]

desc 'Task para execução dos specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/*_spec.rb'
  t.verbose = false
  t.rspec_opts = '--format html --out reports/rspec_results.html'
  t.rspec_opts = '--format documentation -r  ./spec/spec_helper.rb'
end

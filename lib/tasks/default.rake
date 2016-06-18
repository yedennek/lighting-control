Rake::Task["default"].clear if Rake::Task.task_defined?(:default)

ENV['COVERAGE_PERCENT'] = '100'

task default: %i[
  bake:rspec
  bake:bundle-audit
  bake:brakeman
  notes
  log:clear
  bake:ok_rainbow
]

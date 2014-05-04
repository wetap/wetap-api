require 'ci/reporter/rake/rspec'
ENV['CI_REPORTS'] = File.expand_path(File.join(__FILE__, '..', '..', '..', 'ci-reports'))

ENV['RACK_ENV'] = 'test'

require_relative '../app.rb'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rake'

require 'simplecov'
require 'simplecov-console'

Capybara.app = MakersBnB

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                                 # Want a nice code coverage website? Uncomment this next line!
                                                                 # SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

# Load rake file for database tasks
rake = Rake.application
rake.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['db:setup'].invoke # this respects the env setting where as the other option doesn't # rake['db:setup'].execute
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

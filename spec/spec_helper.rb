require 'rubygems'
require 'spork'

Spork.prefork do
        ENV["RAILS_ENV"] ||= 'test'
        require File.expand_path("../../config/environment", __FILE__)
        require 'rspec/rails'
        require 'rspec/autorun'
        require 'capybara/rspec'
        require Rails.root.join('db','seeds')

        Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

        RSpec.configure do |config|
          config.mock_with :rspec
          config.use_transactional_fixtures = false
          config.infer_base_class_for_anonymous_controllers = false
          config.before(:suite) {
            DatabaseCleaner.strategy = :truncation, {:except => %w[roles]}
          }
          config.before(:each) { DatabaseCleaner.start }
          config.after(:each) { DatabaseCleaner.clean }
        end
end

Spork.each_run do

end

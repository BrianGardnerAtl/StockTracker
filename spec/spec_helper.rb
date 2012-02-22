# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :mocha
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.extend VCR::RSpec::Macros
end

VCR.config do |c|
  c.cassette_library_dir = File.expand_path(File.join('fixtures', 'vcr_cassettes'), File.dirname(__FILE__))
  c.stub_with :fakeweb
  c.default_cassette_options = { :record => :new_episodes }
end

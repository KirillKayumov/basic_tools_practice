ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods
  config.include Formulaic::Dsl, type: :feature
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers

  config.before do
    ActionMailer::Base.deliveries.clear
  end
end

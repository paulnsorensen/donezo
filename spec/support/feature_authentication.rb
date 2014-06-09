module FeatureAuthentication
  include Warden::Test::Helpers
  Warden.test_mode!

  RSpec.configure do |config|
    config.after(:each) { Warden.test_reset! }
  end
end

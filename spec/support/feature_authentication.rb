module FeatureAuthentication
  include Warden::Test::Helpers
  Warden.test_mode!

  RSpec.configure do |config|
    config.after(:each) { Warden.test_reset! }
  end

  def login(identity = create_identity)
    login_as(identity, scope: :identity)
  end

  def create_identity(attributes = {})
    default_attributes = {
      email: 'foo@bar.com',
      password: 'password132',
      password_confirmation: 'password132'
    }
    Identity.create!(default_attributes.merge(attributes))
  end
end

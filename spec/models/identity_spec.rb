require 'rails_helper'

RSpec.describe Identity, type: :model do
  it { should have_one(:user) }
end

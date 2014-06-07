require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:identity) }
  it { should have_many(:team_memberships) }
  it { should have_many(:teams).through(:team_memberships) }
  it { should have_many(:tasks) }
end

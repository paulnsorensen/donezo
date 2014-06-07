require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many(:team_memberships) }
  it { should have_many(:users).through(:team_memberships) }
  it { should have_many(:tasks) }
end

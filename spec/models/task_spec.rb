require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:team) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:done_at) }
end

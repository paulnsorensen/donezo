class User < ActiveRecord::Base
  belongs_to :identity
  has_many :team_memberships
  has_many :teams, through: :team_memberships
  has_many :tasks
end

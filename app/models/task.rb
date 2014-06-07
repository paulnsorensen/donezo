class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  validates :name, :done_at, presence: true
end

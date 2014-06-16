class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  validates :name, :done_at, presence: true

  scope :for_user, ->(user) { where(user_id: user.id) }
  scope :search, ->(query) { where('name @@ ?', query) }
end

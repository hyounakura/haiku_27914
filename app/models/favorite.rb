class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :haiku

  validates :user_id, presence: true
  validates :haiku_id, presence: true
end

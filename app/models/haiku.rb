class Haiku < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :kami, :naka, :simo
  end
end

class Haiku < ApplicationRecord
  belongs_to :user
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  with_options presence: true do
    validates :kami, :naka, :simo
  end

  class << self
    def within_box(distance, latitude, longitude)
      distance = distance
      center_point = [latitude, longitude]
      box = Geocoder::Calculations.bounding_box(center_point, distance)
      within_bounding_box(box)
    end
  end
end

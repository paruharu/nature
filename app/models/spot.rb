class Spot < ApplicationRecord
  belongs_to :post_image_id
  belongs_to :post_image

  geocoded_by :address
  after_validation :geocode

end

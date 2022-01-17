class Spot < ApplicationRecord
  belongs_to :post_image_id
  belongs_to :review
end

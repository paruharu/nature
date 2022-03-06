class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :genre, presence: true
  validates :image, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  

  # has_one :spot, dependent: :destroy
  # accepts_nested_attributes_for :spot

  geocoded_by :address
  after_validation :geocode

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


end

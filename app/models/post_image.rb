class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


end

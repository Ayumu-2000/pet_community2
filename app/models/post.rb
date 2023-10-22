class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :genres, dependent: :destroy
  
  def favorite_by?(user)
    favorites.exists?(user_id: user.id)
  end
end

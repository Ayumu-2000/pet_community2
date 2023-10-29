class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :genre_id, presence: true
  validates :pet_name, presence: true
  validates :pet_explanation, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end

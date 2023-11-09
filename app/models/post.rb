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

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      Post.where("pet_name LIKE?","#{word}")
    elsif search == "forward_match"
      Post.where("pet_name LIKE?","#{word}%")
    elsif search == "backward_match"
      Post.where("pet_name LIKE?","%#{word}")
    elsif search == "partial_match"
      Post.where("pet_name LIKE?","%#{word}%")
    else
      Post.all
    end
  end
end

class Public::HomesController < ApplicationController
  def top
    @user = current_user
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end
end

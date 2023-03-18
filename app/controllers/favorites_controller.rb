class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    flash[:success] = '投稿をお気に入り登録しました。'
    redirect_to request.referer
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    flash[:success] = '投稿のお気に入り登録を解除しました。'
    redirect_to request.referer
  end
end

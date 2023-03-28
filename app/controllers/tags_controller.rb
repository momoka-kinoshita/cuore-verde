class TagsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = 'タグ項目を追加しました。'
      redirect_to request.referer
    else
      flash.now[:danger] = 'タグ項目の追加に失敗しました。'
      render 'posts/new'
    end
  end
  
  
  private

  def tag_params
    params.require(:tag).permit(:name, :category)
  end
  
end

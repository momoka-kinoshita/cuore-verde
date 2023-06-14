class PostsController < ApplicationController
  before_action :require_user_logged_in
  # before_action :correct_user, only: [:edit, :update]

  
  def index
    @posts = Post.order(id: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build  # form_with 用
    @tag = Tag.new # タグ追加機能テスト
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      puts root_url
      flash[:success] = '投稿しました。'
      redirect_to root_url
    else
      @posts = current_user.posts.order(id: :desc)
      flash.now[:danger] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = '投稿は正常に更新されました。'
      redirect_to root_url
    else
      @posts = current_user.posts.order(id: :desc)
      flash.now[:danger] = '投稿は更新されませんでした。'
      render 'toppages/index'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to root_url
    # redirect_back(fallback_location: root_path)
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:maintitle, :memo, :video, tag_ids: [])
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end

  
end

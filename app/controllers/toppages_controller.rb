class ToppagesController < ApplicationController
  
  def index
    if logged_in?
       
      # 複数条件（テスト）メンターの方に教えていただいたコード
       @posts = Post.order(id: :desc)
       if params[:tag_id].present?
        # タグ表示
         @tags = Tag.find(params[:tag_id])
        # ↓配列を文字列から数字に変換
         params[:tag_id] = params[:tag_id].map do |e|  e.to_i end
         @posts = @posts.joins(:tags).includes(:tags).select do |post|
           (params[:tag_id] - post.tags.pluck(:id)).blank?
         end
       end
       
      counts(@posts)
    end
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:maintitle, :memo, :video, tag_ids: [] )
  end
  
  # 追記 連続再生テスト
  def counts(post)
    @count_video = @posts.count
  end
  
end
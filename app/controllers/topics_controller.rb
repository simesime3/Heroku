class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
    # @comments = Comment.all.includes(:comment_users)
    # binding.pry
    # @heart_count = Topic.favorites.where(topic_id: :topic_id).count
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end

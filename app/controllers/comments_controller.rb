class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    # @comment_topics = current_user.comment_topics
  end

  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id =
    @comment.comment = params[:comment]
    if @comment.save
      redirect_to topics_path, success: 'commentに成功しました'
    else
      flash.now[:danger] = "commentに失敗しました"
      render :index
      binding.pry
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id, :comment)
  end
end

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'commentに成功しました'
    else
      flash.now[:danger] = "commentに失敗しました"
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:topic_id, :comment)
  end
end

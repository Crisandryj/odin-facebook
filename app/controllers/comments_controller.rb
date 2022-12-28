class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:notice] = 'created comment'
      redirect_to posts_path
    else
      flash.now[:notice] = @comment.errors.full_messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end

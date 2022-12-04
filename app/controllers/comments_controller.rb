class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:notice] = 'created comment'
    else
      render new
    end
  end

  private

  def comment_pararms
    params.require(:comment).permit(:body)
  end
end

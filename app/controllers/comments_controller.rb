class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:notice] = 'created comment'
    else
      render @comment
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

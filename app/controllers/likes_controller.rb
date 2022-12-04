class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.create(like_params)
    if @like.save
      flash.now[:notice] = "liked post"
    else
      flash.now[:notice] = @like.errors.full_messages
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end

  private

  def like_params
    params.permit(:user_id,:post_id,:like)
  end
end

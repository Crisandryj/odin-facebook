class PostsController < ApplicationController
  def index
    @comment = Comment.new
    @posts = Post.all.order('created_at DESC')
    @post = Post.new
  end

  def new
    @post = Post.new
    @post.comments.build
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash.now[:notice] = 'posted'
      redirect_to posts_path
    else
      flash[:notice] = @post.errors.full_messages
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, comment_attributes: [:body,:user_id,:post_id])
  end
end

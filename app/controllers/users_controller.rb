class UsersController < ApplicationController
  def index
    @user = User.all

  end

  def show
    @user = User.find(params[:id])
  end

  def update
    raise params.inspect
    @friend = Friend.update(friend_params)
  end

  private


end

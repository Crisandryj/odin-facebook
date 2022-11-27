class FriendsController < ApplicationController
  def index
    @user = User.all
  end

  def create
    raise params.inspect
    @friend = Friend.create(friend_params)
  end

  def update
    @friend = Friend.update(params[:id])
  end

  private

    def friend_params
      params.require(:user).permit(:followee)
    end

end

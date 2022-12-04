class UsersController < ApplicationController
  def index
    @request = Request.new()
    @user = User.all()
  end

  def show
    @user = User.find(params[:id])
  end

  def create

  end

  def update

  end

  private
  def request_params
    params.require(:request).permit(:invitee_id,:invitor_id,:accepted)
  end

end

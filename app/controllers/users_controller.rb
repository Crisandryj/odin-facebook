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


end

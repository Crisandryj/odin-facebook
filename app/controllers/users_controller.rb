class UsersController < ApplicationController
  def index
    @request = Request.new()
    @users = User.all().order(:email)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      respond_to do |format|
      if @user.update(user_params)
          format.html { redirect_to @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end


end


  private

  def user_params
    params.require(:user).permit(:firstname,:lastname,:birthday,:age,:relationship)

  end


end

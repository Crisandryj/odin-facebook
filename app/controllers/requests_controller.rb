class RequestsController < ApplicationController
  def index
    @users = User.all
    @requests = Request.all
  end

  def new
    @users = User.all
    @request = Request.new()
  end

  def create
    @users = User.all
    @request = Request.create(request_params)
    if @request.save
      flash[:notice] = "Requested friend!"
    else
      flash[:notice] = "Did not submit"
      render 'new'
    end
  end

  def destroy
  end


  private

  def request_params
    params.require(:request).permit(:invitee_id,:invitor_id,:accepted)
  end

end

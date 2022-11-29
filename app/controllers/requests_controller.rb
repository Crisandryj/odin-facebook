class RequestsController < ApplicationController
  def index
    @request = Request.all
  end

  def new
    @request = Request.new(request_params)
    @users = User.all
  end

  def create
   raise params.inspect
    @request = Request.create(request_params)
    if @request.save
      flash[:notice] = "Requested friend!"
    else
      render 'new'
    end
  end

  def destroy
  end


  private

  def request_params
    params.permit(:invitee_id,:invitor_id,:accept)
  end

end

class RequestsController < ApplicationController
  def index
    @request = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.create(request_params)
    if @request.save
      flash[:notice] = "Sent friend request!"
    else
      render 'new'
    end
  end

  def destroy
  end


  private

  def request_params
    params.require(:request).permit(:accept)
  end

end

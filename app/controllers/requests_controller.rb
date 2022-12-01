class RequestsController < ApplicationController
  def index
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

  def edit
    @request = Request.find(params[:id])
    redirect_to update
  end

  def update
    @request = Request.find(params[:id])
    @request.update(update_params)
  end


  def destroy
  end


  private

  def request_params
    params.require(:request).permit(:invitee_id,:invitor_id,:accepted)
  end

  def update_params
    params.permit(:invitee_id,:invitor_id,:accepted)
  end

end

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
      flash.now[:notice] = "Requested friend!"
    else
      flash.now[:notice] = "Did not submit"
      render 'new'
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    @request.update(update_params)
    if @request.save
      if @request.accepted == true
        invitor = User.find(@request.invitor_id)
        invitee = User.find(@request.invitee_id)
        invitor.followees << invitee
      end
      else
        render new
    end
  end


  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    flash[:notice] = "Declined request"
  end


  private

  def request_params
    params.require(:request).permit(:invitee_id,:invitor_id,:accepted)
  end

  def update_params
    params.permit(:invitee_id,:invitor_id,:accepted)
  end

end

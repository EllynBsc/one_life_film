class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create]
  before_action :set_request, only: [:send_reminder, :update]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      flash[:notice] = "We komen binnen twee weken bij je terug! Kijk in je mail voor de confirmatie."
      RequestMailer.received(@request).deliver_now
      redirect_to root_path
    else
      flash[:alert] = "Please review the errors below"
      render :new
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:phone_number, :date_wedding, :location_wedding, :name, :email_address, :subject, :message)
  end

end

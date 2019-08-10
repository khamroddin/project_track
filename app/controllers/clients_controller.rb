class ClientsController < ApplicationController
  def index
  end
  def new
    @clients = Client.all
    @client = Client.new
    @locations = Location.all.map{|l| [l.name,l.id]}
    @organizations = Organization.all.map{|l| [l.name,l.id]}

  end
  def create
      @client = Client.new(params[:client].permit(:client_name,:location_id,:organization_id ,:status))
      if @client.save
        flash[:notice] = "successfully created"
        redirect_to new_client_path
      end
  end
  def show
  end
end

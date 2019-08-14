class ClientsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @clients = Client.all
    @client = Client.new
    @locations = Location.all.map{|l| [l.name,l.id]}
    @organizations = Organization.all.map{|l| [l.name,l.id]}
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = "successfully created"
      redirect_to new_client_path
    else
      render :new
    end
  end

  def edit
    @client = Client.find params[:id]
    @organizations = Organization.all.map{|l| [l.name,l.id]}
  end

  def update
    @client = Client.find params[:id]
    if @client.update_attributes(client_params)
      flash[:notice] = "Successfully Updated"
      redirect_to new_client_path
    else
      @organizations = Organization.all.map{|l| [l.name,l.id]}
      render :edit
    end
  end

  def destroy
    @client = Client.find params[:id]
    if @client.destroy
      flash[:notice] = "Deleted Organization"
    end
    redirect_to new_client_path
  end

  private
  def client_params
    params.require(:client).permit(:client_name,:organization_id ,:status)
  end
end

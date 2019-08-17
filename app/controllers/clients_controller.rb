class ClientsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
    @organization = Organization.first
  end

  def create
    @client = Client.new(client_params)
    @organization = Organization.first

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: 'Client was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  def edit
    @client = Client.find params[:id]
    @organization = Organization.first
  end

  def update
    @client = Client.find params[:id]
    @organization = Organization.first

    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'Client was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @client = Client.find params[:id]
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_path, notice: 'Client was successfully destroyed.' }
    end
  end

  private
  def client_params
    params.require(:client).permit(:client_name,:organization_id ,:status)
  end
end

class OrganizationController < ApplicationController
  def new
    @organization = Organization.new
    @locations = ['Banglore','Hyderabad','Delhi','Pune']
  end

  def create
    params.permit!
    @organization = Organization.new(params[:organization])
    if @organization.save
      flash[:notice] = "successfully created"
      redirect_to action: 'index',controller: 'home'
    end
  end
end

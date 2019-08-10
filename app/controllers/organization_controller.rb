class OrganizationController < ApplicationController
  def new
    @organization = Organization.new
    @organizations = Organization.all
    @locations = Location.all.map{|l| [l.name,l.id]}
    if params[:organization].present?
      params.permit!
      @organization = Organization.new(params[:organization])
      if @organization.save
        flash[:notice] = "successfully created"
        redirect_to home_index_path
      end
    end
  end

  def new_location
    @location = Location.new
    @all_locations = Location.all
    if params[:location].present?
      params.permit!
      @location = Location.new(params[:location])
      if @location.save
        flash[:notice] = "successfully created"
        redirect_to organization_new_location_path
      end
    end
  end

  def edit
    @organization = Organization.find params[:id]
  end
end

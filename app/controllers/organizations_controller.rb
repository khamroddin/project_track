class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
    @organizations = Organization.all
    @locations = Location.all.map{|l| [l.name,l.id]}
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      flash[:notice] = "Successfully Created"
      redirect_to new_organization_path
    else
      render :new
    end
  end

  def edit
    @organization = Organization.find params[:id]
    @locations = Location.all.map{|l| [l.name,l.id]}
  end

  def update
    @organization = Organization.find params[:id]
    if @organization.update_attributes(organization_params)
      flash[:notice] = "Successfully Updated"
      redirect_to new_organization_path
    else
      @locations = Location.all.map{|l| [l.name,l.id]}
      render :edit
    end
  end

  def destroy
    @organization = Organization.find params[:id]
    if @organization.destroy
      flash[:notice] = "Deleted Organization"
    end
    redirect_to new_organization_path
  end

  private
  def organization_params
    params.require(:organization).permit(:name,:location_id,:website,:logo)
  end
end

class OrganizationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @organizations = Organization.all
  end


  def new
    @organization = Organization.new
    @locations = Location.all.map{|l| [l.name,l.id]} rescue []
  end

  def create
    @organization = Organization.new(organization_params)
    respond_to do |format|
      if @organization.save
        format.html { redirect_to organizations_path, notice: 'Organization was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @organization = Organization.find params[:id]
    @locations = Location.all.map{|l| [l.name,l.id]}
  end

  def update
    @organization = Organization.find params[:id]
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to organizations_path, notice: 'Organization was successfully updated.' }
      else
        @locations = Location.all.map{|l| [l.name,l.id]} rescue []
        format.html { render :edit }
      end
    end
  end

  def destroy
    @organization = Organization.find params[:id]
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_path, notice: 'Organization was successfully destroyed.' }
    end
  end

  private
  def organization_params
    params.require(:organization).permit(:name,:location_id,:website,:logo)
  end
end

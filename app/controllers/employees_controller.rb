class EmployeesController < ApplicationController
  before_filter :authenticate_user!
  layout 'application'

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @positions = EmployeePosition.all.map{|l| [l.name,l.id]}
    @categories = EmployeeCategory.all.map{|l| [l.name,l.id]}
    @organizations = Organization.all.map{|l| [l.name,l.id]}
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Successfully added #{@employee.employee_no}"
      redirect_to employees_path
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find params[:id]
    @positions = EmployeePosition.all.map{|l| [l.name,l.id]}
    @categories = EmployeeCategory.all.map{|l| [l.name,l.id]}
    @organizations = Organization.all.map{|l| [l.name,l.id]}
  end

  def update
    @employee = Employee.find params[:id]
    if @employee.update_attributes(employee_params)
      flash[:notice] = "Successfully Updated"
      redirect_to employees_path
    else
      @positions = EmployeePosition.all.map{|l| [l.name,l.id]}
      @categories = EmployeeCategory.all.map{|l| [l.name,l.id]}
      @organizations = Organization.all.map{|l| [l.name,l.id]}
      render :edit
    end
  end

  def destroy
    @employee = Employee.find params[:id]
    if @employee.destroy
      flash[:notice] = "Deleted Employee"
    end
    redirect_to employees_path
  end

  private
  def employee_params
    params.require(:employee).permit!
  end

end

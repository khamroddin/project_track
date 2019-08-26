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
    @organization = Organization.first
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_path, notice: "Employee #{@employee.employee_no} was successfully created." }
      else
        @positions = EmployeePosition.all.map{|l| [l.name,l.id]}
        @categories = EmployeeCategory.all.map{|l| [l.name,l.id]}
        @organization = Organization.first
        format.html { render :new }
      end
    end
  end

  def edit
    @employee = Employee.find params[:id]
    @positions = EmployeePosition.all.map{|l| [l.name,l.id]}
    @categories = EmployeeCategory.all.map{|l| [l.name,l.id]}
    @organization = Organization.first
  end

  def update
    @employee = Employee.find params[:id]
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_path, notice: 'Employee was successfully updated.' }
      else
        @positions = EmployeePosition.all.map{|l| [l.name,l.id]}
        @categories = EmployeeCategory.all.map{|l| [l.name,l.id]}
        @organization = Organization.first
        format.html { render :edit }
      end
    end

  end

  def destroy
    @employee = Employee.find params[:id]
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_path, notice: 'Employee was successfully destroyed.' }
    end
  end
  def employee_projects
    @project = Project.find(params[:project_id])
    @employees = Employee.where("id NOT IN(?)", @project.manager_id).map{|l| [l.full_name,l.id]}
    @project_employees = @project.employee_projects
    @employee_project = EmployeeProject.new
    if params[:employee_project]
      @employee_project = EmployeeProject.new(employee_project_params)
      if @employee_project.save
        redirect_to employees_employee_projects_path(:project_id=>params[:project_id]), notice: 'Employee was successfully updated.'
      end
    end

  end
  private
  def employee_params
    params.require(:employee).permit!
  end
  def employee_project_params
    params.require(:employee_project).permit!
  end

end

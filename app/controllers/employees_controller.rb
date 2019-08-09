class EmployeesController < ApplicationController
  before_filter :authenticate_user!
  layout 'application'
  def index
  end
  def new_category
    @employee_category = EmployeeCategory.new
    @employee_categories = EmployeeCategory.all
    if request.post?
      @employee_category = EmployeeCategory.new(params[:employee_category].permit(:name, :status))
      if @employee_category.save
        redirect_to :action=> :new_category
      end
    end
  end
  def edit_category
    @employee_category = EmployeeCategory.find(params[:id])
    if request.post?
      if @employee_category.update_attributes(params[:employee_category].permit(:name, :status))
        redirect_to :action=> :new_category
      end
    end
  end
  def new_position
    @employee_position = EmployeePosition.new
    @employee_positions = EmployeePosition.all
    if request.post?
      @employee_position= EmployeePosition.new(params[:employee_position].permit(:name, :status))
      if @employee_position.save
        redirect_to :action=> :new_position
      end
    end
  end
  def edit_position
    @employee_position = EmployeePosition.find(params[:id])
    if request.post?
      if @employee_position.update_attributes(params[:employee_position].permit(:name, :status))
        redirect_to :action=> :new_position
      end
    end
  end
end

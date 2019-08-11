class EmployeeCategoriesController < ApplicationController
  def new
    @employee_category = EmployeeCategory.new
    @employee_categories = EmployeeCategory.all
  end

  def create
    @employee_category = EmployeeCategory.new(employee_categories_params)
    if @employee_category.save
      flash[:notice] = "Successfully Created"
      redirect_to new_employee_category_path
    else
      render :new
    end
  end

  def edit
    @employee_category = EmployeeCategory.find(params[:id])
  end

  def update
    @employee_category = EmployeeCategory.find(params[:id])
    if @employee_category.update_attributes(employee_categories_params)
      flash[:notice] = "Successfully Updated"
      redirect_to new_employee_category_path
    else
      render :edit
    end
  end

  def destroy
    @employee_category = EmployeeCategory.find(params[:id])
    if @employee_category.destroy
      flash[:notice] = "Deleted Category"
    end
    redirect_to new_employee_category_path
  end

  private
  def employee_categories_params
    params.require(:employee_category).permit(:name, :status)
  end
end

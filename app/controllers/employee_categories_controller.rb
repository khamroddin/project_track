class EmployeeCategoriesController < ApplicationController
  def index
    @employee_categories = EmployeeCategory.all
  end
  def new
    @employee_category = EmployeeCategory.new
  end

  def create
    @employee_category = EmployeeCategory.new(employee_categories_params)
    respond_to do |format|
      if @employee_category.save
        format.html { redirect_to employee_category_path, notice: 'Employee Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @employee_category = EmployeeCategory.find(params[:id])
  end

  def update
    @employee_category = EmployeeCategory.find(params[:id])
    respond_to do |format|
      if @client.update(employee_categories_params)
        format.html { redirect_to employee_categories_path, notice: 'Employee Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee_category = EmployeeCategory.find(params[:id])
    @employee_category.destroy
    respond_to do |format|
      format.html { redirect_to employee_categories_path, notice: 'Employee Category was successfully destroyed.' }
    end
  end

  private
  def employee_categories_params
    params.require(:employee_category).permit(:name, :status)
  end
end

class EmployeePositionsController < ApplicationController
  def new
    @employee_position = EmployeePosition.new
    @employee_positions = EmployeePosition.all
  end

  def create
    @employee_position= EmployeePosition.new(employee_position_params)
    if @employee_position.save
      flash[:notice] = "Successfully Created"
      redirect_to new_employee_position_path
    else
      render :new
    end
  end

  def edit
    @employee_position = EmployeePosition.find(params[:id])
  end

  def update
    @employee_position = EmployeePosition.find(params[:id])
    if @employee_position.update_attributes(employee_position_params)
      flash[:notice] = "Successfully Updated"
      redirect_to new_employee_position_path
    else
      render :edit
    end
  end

  def destroy
    @employee_position = EmployeePosition.find(params[:id])
    @employee_position.destroy
    redirect_to new_employee_position_path
  end

  private
  def employee_position_params
    params.require(:employee_position).permit(:name, :status)
  end
end

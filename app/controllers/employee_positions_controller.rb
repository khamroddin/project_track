class EmployeePositionsController < ApplicationController
  before_filter :authenticate_user!

  def  index
    @employee_positions = EmployeePosition.all
  end



  def new
    @employee_position = EmployeePosition.new
  end

  def create
    @employee_position= EmployeePosition.new(employee_position_params)
    respond_to do |format|
      if @employee_position.save
        format.html { redirect_to employee_positions_path, notice: 'Employee Position was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @employee_position = EmployeePosition.find(params[:id])
  end

  def update
    @employee_position = EmployeePosition.find(params[:id])
    respond_to do |format|
      if @employee_position.update(employee_position_params)
        format.html { redirect_to employee_positions_path, notice: 'Employee Position was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee_position = EmployeePosition.find(params[:id])
    @employee_position.destroy
    respond_to do |format|
      format.html { redirect_to employee_positions_path, notice: 'Employee Position was successfully destroyed.' }
    end
  end

  private
  def employee_position_params
    params.require(:employee_position).permit(:name, :status)
  end
end

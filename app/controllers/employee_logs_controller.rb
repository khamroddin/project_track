class EmployeeLogsController < ApplicationController
  before_action :set_employee_log, only: [:show, :edit, :update, :destroy]

  # GET /employee_logs
  # GET /employee_logs.json
  def index
    @employee_logs = EmployeeLog.all
  end

  # GET /employee_logs/1
  # GET /employee_logs/1.json
  def show
  end

  # GET /employee_logs/new
  def new
    @employee_log = EmployeeLog.new
  end

  # GET /employee_logs/1/edit
  def edit
  end

  # POST /employee_logs
  # POST /employee_logs.json
  def create
    @employee_log = EmployeeLog.find_by(log_date: params[:employee_log][:log_date])
    respond_to do |format|
      if @employee_log.present?
        @employee_log.update(employee_log_params)
        format.html { redirect_to @employee_log, notice: 'Employee log was successfully updated.' }
        format.json { render :show, status: :created, location: @employee_log }
      else
        @employee_log = EmployeeLog.new(employee_log_params)
        if @employee_log.save
          format.html { redirect_to @employee_log, notice: 'Employee log was successfully created.' }
          format.json { render :show, status: :created, location: @employee_log }
        else
          format.html { redirect_to :calendar_view }
          format.json { render json: @employee_log.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /employee_logs/1
  # PATCH/PUT /employee_logs/1.json
  def update
    respond_to do |format|
      if @employee_log.update(employee_log_params)
        format.html { redirect_to @employee_log, notice: 'Employee log was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_log }
      else
        format.html { render :edit }
        format.json { render json: @employee_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_logs/1
  # DELETE /employee_logs/1.json
  def destroy
    @employee_log.destroy
    respond_to do |format|
      format.html { redirect_to employee_logs_url, notice: 'Employee log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calendar_view
    @employee_log = EmployeeLog.new()
    @events = EmployeeLog.where(:employee_id => current_user.employee_record.id)
    @tasks = Task.all.map{|p| [p.name,p.id]} rescue []
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_log
      @employee_log = EmployeeLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_log_params
      params.require(:employee_log).permit(:employee_id, :task_id, :log_date, :start_time, :end_time, :total_hours,:notes)
    end
end

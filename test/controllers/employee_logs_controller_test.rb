require 'test_helper'

class EmployeeLogsControllerTest < ActionController::TestCase
  setup do
    @employee_log = employee_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_log" do
    assert_difference('EmployeeLog.count') do
      post :create, employee_log: { employee_id: @employee_log.employee_id, end_time: @employee_log.end_time, log_date: @employee_log.log_date, start_time: @employee_log.start_time, task_id: @employee_log.task_id, total_hours: @employee_log.total_hours }
    end

    assert_redirected_to employee_log_path(assigns(:employee_log))
  end

  test "should show employee_log" do
    get :show, id: @employee_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_log
    assert_response :success
  end

  test "should update employee_log" do
    patch :update, id: @employee_log, employee_log: { employee_id: @employee_log.employee_id, end_time: @employee_log.end_time, log_date: @employee_log.log_date, start_time: @employee_log.start_time, task_id: @employee_log.task_id, total_hours: @employee_log.total_hours }
    assert_redirected_to employee_log_path(assigns(:employee_log))
  end

  test "should destroy employee_log" do
    assert_difference('EmployeeLog.count', -1) do
      delete :destroy, id: @employee_log
    end

    assert_redirected_to employee_logs_path
  end
end

json.extract! employee_log, :id, :employee_id, :task_id, :log_date, :start_time, :end_time, :total_hours, :created_at, :updated_at
json.url employee_log_url(employee_log, format: :json)

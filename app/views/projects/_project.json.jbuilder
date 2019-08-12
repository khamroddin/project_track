json.extract! project, :id, :project_name, :client_id, :start_date, :end_date, :manager_id, :status, :created_at, :updated_at
json.url project_url(project, format: :json)

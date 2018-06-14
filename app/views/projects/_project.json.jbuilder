json.extract! project, :id, :name, :number, :project_state_id, :project_type_id, :start_date, :end_date, :notes, :created_at, :updated_at
json.url project_url(project, format: :json)
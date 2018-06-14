json.extract! subject, :id, :name, :slug, :parent_id, :created_at, :updated_at
json.url subject_url(subject, format: :json)
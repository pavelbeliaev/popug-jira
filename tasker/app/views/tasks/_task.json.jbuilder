json.extract! task, :id, :account_id, :description, :price, :fee, :created_at, :completed_at, :status, :public_id, :created_at, :updated_at
json.url task_url(task, format: :json)

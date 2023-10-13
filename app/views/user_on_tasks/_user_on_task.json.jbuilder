json.extract! user_on_task, :id, :user_id, :task_id, :group_id, :created_at, :updated_at
json.url user_on_task_url(user_on_task, format: :json)

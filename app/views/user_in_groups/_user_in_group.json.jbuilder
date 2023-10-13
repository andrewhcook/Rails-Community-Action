json.extract! user_in_group, :id, :group_id, :user_id, :admin, :created_at, :updated_at
json.url user_in_group_url(user_in_group, format: :json)

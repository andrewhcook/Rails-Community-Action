json.extract! user, :id, :username, :avatar_url, :contact_info, :inspirational_quote, :bio, :email, :created_at, :updated_at
json.url user_url(user, format: :json)

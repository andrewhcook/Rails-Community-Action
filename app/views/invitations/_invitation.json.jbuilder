json.extract! invitation, :id, :group_id, :sender_id, :recipient_id, :status, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)

json.extract! notification, :id, :player_id, :message, :created_at, :updated_at
json.url notification_url(notification, format: :json)

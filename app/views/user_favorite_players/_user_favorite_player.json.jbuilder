json.extract! user_favorite_player, :id, :user_id, :player_id, :created_at, :updated_at
json.url user_favorite_player_url(user_favorite_player, format: :json)

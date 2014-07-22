json.extract! water_fountain, :id, :created_at, :updated_at, :location, :user_id
json.url api_v1_water_fountain_url(water_fountain, format: :json)
json.image_url water_fountain.thumbnail_url

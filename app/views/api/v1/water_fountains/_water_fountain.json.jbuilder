json.extract! water_fountain, :id, :created_at, :updated_at, :location, :user_id, :user_name, :working, :filling_station, :dog_bowl, :flow
json.url api_v1_water_fountain_url(water_fountain, format: :json)
json.image_url water_fountain.thumbnail_url

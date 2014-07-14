json.array!(@water_fountains) do |water_fountain|
  json.extract! water_fountain, :id, :location, :image_url, :user_id
  json.url api_v1_water_fountain_url(water_fountain, format: :json)
end

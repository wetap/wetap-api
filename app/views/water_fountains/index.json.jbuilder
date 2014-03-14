json.array!(@water_fountains) do |water_fountain|
  json.extract! water_fountain, :id, :location
  json.url water_fountain_url(water_fountain, format: :json)
end

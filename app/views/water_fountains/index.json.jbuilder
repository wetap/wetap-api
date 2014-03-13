json.array!(@water_fountains) do |water_fountain|
  json.extract! water_fountain, :id
  json.point RGeo::GeoJSON.encode(water_fountain.point)
  json.url water_fountain_url(water_fountain, format: :json)
end

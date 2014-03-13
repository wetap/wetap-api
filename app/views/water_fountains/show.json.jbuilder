json.extract! @water_fountain, :id, :created_at, :updated_at
json.location RGeo::GeoJSON.encode(water_fountain.point)

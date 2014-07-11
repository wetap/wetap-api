json.extract! water_fountain, :id, :created_at, :updated_at, :location
json.url api_v1_water_fountain_url(water_fountain, format: :json)
if(water_fountain.image.present?)
  json.image_url water_fountain.image.url(:thumb)
else
  json.image_url nil
end

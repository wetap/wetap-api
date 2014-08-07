FactoryGirl.define do
  factory :water_fountain do
    location ({"type"=>"Point", "coordinates"=>[1.0, 1.0]})
    working true
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Montpelier Vermont City Hall
WaterFountain.create!("location" => { "type" => "Point",
                                      "coordinates" => [-72.5755, 44.2592] })

# San Francisco Museum of the African Diaspora
WaterFountain.create!("location" => { "type" => "Point",
                                      "coordinates" => [-122.4014, 37.7858] })


# Ian's house
WaterFountain.create!("location" => { "type" => "Point",
                                      "coordinates" => [-118.3240, 34.0937] })

User.create!("email" => "admin@wetap-api.com",
             "password" => "anyanyany")
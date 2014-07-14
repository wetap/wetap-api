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

AuthTokenPair.create!({"public_token" => "fake-public-token",
                       "private_token" => "fake-private-token",
                       "user_id" => 1,
                       "created_at" => "Mon, 07 Jul 2014 20:16:41 UTC +00:00", "updated_at"=>"Mon, 07 Jul 2014 20:16:41 UTC +00:00"})

User.create!("email" => "admin@wetap-api.com",
             "password" => "anyanyany",
             "confirmation_token" => nil,
             "confirmed_at" => "Mon, 07 Jul 2014 20:14:00 UTC +00:00",
             "updated_at" => "Mon, 07 Jul 2014 20:14:00 UTC +00:00")


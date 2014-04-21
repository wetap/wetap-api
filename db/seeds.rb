# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# LA Union Station
WaterFountain.create!("location" => { "type" => "Point",
                                      "coordinates" => [34.055, -118.2352] })

# San Francisco MOMA
WaterFountain.create!("location" => { "type" => "Point",
                                      "coordinates" => [37.7858, -122.4008] })



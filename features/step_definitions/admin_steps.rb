Given(/^there are some fountains$/) do
  # Montpelier Vermont City Hall
  WaterFountain.create!("location" => { "type" => "Point",
                                        "coordinates" => [-72.5755, 44.2592] })

  # San Francisco MOMA
  WaterFountain.create!("location" => { "type" => "Point",
                                        "coordinates" => [-122.4008, 37.7858] })


end

When(/^I go to the fountain list page$/) do
  visit '/'
end

Then(/^I should see a list of fountains$/) do
  expect(page).to have_content('-72.5755')
end

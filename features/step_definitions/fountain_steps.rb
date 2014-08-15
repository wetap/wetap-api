When(/^I go to the fountain list page$/) do
  visit '/admin'
end

Then(/^I should see a list of fountains$/) do
  expect(page).to have_content('-72.5755')
end

Then(/^I should see the login page$/) do
  expect(page).to have_content('WeTap Sign in')
end

When(/^I go to the new fountain page$/) do
  visit '/admin/#/water_fountain/new'
end

Then(/^I should see that I successfully created a fountain$/) do
  expect(page).not_to have_content(/New Water Fountain/)
end

When(/^I go to the fountain map page$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see the fountains on the map$/) do
    pending # express the regexp above with the code you wish you had
end

Given(/^there are some fountains$/) do
  # Montpelier Vermont City Hall
  WaterFountain.create!("location" => { "type" => "Point",
                                        "coordinates" => [-72.5755, 44.2592] })

  # San Francisco MOMA
  WaterFountain.create!("location" => { "type" => "Point",
                                        "coordinates" => [-122.4008, 37.7858] })
end


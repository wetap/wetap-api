When(/^I go to the new fountain page$/) do
  visit '/admin/#/water_fountain/new'
end

When(/^I (?:am looking at|go to) the fountain admin$/) do
  visit '/admin'
end

Then(/^I should see that I successfully created a fountain$/) do
  expect(page).not_to have_content(/New Water Fountain/)
end

Then(/^I should see the fountains on the map$/) do
  within("#fountain-admin-map .leaflet-marker-pane") do
    expect(all('img')).not_to be_empty
  end
end

Then (/^I should see the fountains on the list$/) do
  within("#fountain-admin-list") do
    expect(all('tr').count > 1).to be_true
  end
end

When(/^I view the first fountain's details$/) do
  within("#fountain-admin-list") do
    wthin(all('tr')[1]) do
      binding.pry
      click_on "Details"
    end
  end
end

Then(/^I should see that it has a dog bowl$/) do
  within('.fountain-details') do
    expect(page).to have_text("Dog Bowl?: No")
  end
end

Given(/^there are some fountains$/) do
  # Montpelier Vermont City Hall
  WaterFountain.create!("location" => { "type" => "Point",
                                        "coordinates" => [-72.5755, 44.2592] })

  # San Francisco MOMA
  WaterFountain.create!("location" => { "type" => "Point",
                                        "coordinates" => [-122.4008, 37.7858] })
end


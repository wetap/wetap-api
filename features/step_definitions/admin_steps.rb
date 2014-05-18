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

When(/^I go to the new fountain page$/) do
  visit '#/water_fountain/new'
end

And /^I fill in '(.*)' for '(.*)'$/ do |value, field|
  fill_in(field, :with => value)
end

And(/^I click button '(.*)'$/) do |text|
  page.click_button text
end

Then /^I should see '(.*)'$/ do |text|
  expect(page).to have_content(/#{text}/m)
end

# I *so* want this to work - it would allow tests to use the field name from the model
#    instead of having to add an un-needed "id" attribute to each field.
#    This is how they do it in Protractor ...
And /^I fill in '(.*)' for ng-model '(.*)'$/ do |value, field|
  fld = element(by.model(field))
  fld.fill_in(value, :with => value)
end
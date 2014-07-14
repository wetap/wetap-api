Given(/^there are some fountains$/) do
  # Montpelier Vermont City Hall
  WaterFountain.create!("location" => { "type" => "Point",
                                        "coordinates" => [-72.5755, 44.2592] })

  # San Francisco MOMA
  WaterFountain.create!("location" => { "type" => "Point",
                                        "coordinates" => [-122.4008, 37.7858] })


end

And(/^I am logged in as an admin$/) do
  User.create!("email" => "test@example.com", "password" => "anyanyany")
  visit(new_user_session_path)
  fill_in('user_email', :with => 'test@example.com')
  fill_in('user_password', :with => 'anyanyany')
  within("#new_user") { click_on "Sign in" }
end

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

And /^I fill in '(.*)' for '(.*)'$/ do |value, field|
  fill_in(field, :with => value)
end

And(/^I click button '(.*)'$/) do |text|
  page.click_button text
end

Then /^I should see '(.*)'$/ do |text|
  expect(page).to have_content(/#{text}/m)
end

Then /^I should see that I successfully created a fountain$/ do 
  expect(page).not_to have_content(/New Water Fountain/)
end

# I *so* want this to work - it would allow tests to use the field name from the model
#    instead of having to add an un-needed "id" attribute to each field.
#    This is how they do it in Protractor ...
And /^I fill in '(.*)' for ng-model '(.*)'$/ do |value, field|
  fld = element(by.model(field))
  fld.fill_in(value, :with => value)
end

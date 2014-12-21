And(/^I am logged in as an admin$/) do
  admin_user = FactoryGirl.create(:admin_user)
  visit(new_user_session_path)
  fill_in('user_email', :with => admin_user.email)
  fill_in('user_password', :with => admin_user.password)
  within("#new_user") { click_on "Sign in" }
end

And(/^I fill in '(.*)' for '(.*)'$/) do |value, field|
  fill_in(field, :with => value)
end

And(/^I click button '(.*)'$/) do |text|
  page.click_button text
end

Then(/^I should see '(.*)'$/) do |text|
  expect(page).to have_content(/#{text}/m)
end

Then(/^I should see the login page$/) do
  expect(page).to have_content('WeTap Sign in')
end


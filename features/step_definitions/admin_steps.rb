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

# I *so* want this to work - it would allow tests to use the field name from the model
#    instead of having to add an un-needed "id" attribute to each field.
#    This is how they do it in Protractor ...
And(/^I fill in '(.*)' for ng-model '(.*)'$/) do |value, field|
  fld = element(by.model(field))
  fld.fill_in(value, :with => value)
end

require_relative '../rails_helper'

include Capybara::DSL
describe "user sign up and log in" do
 it "should sign up a new user and direct them to their new profile page" do
   visit "/users/sign_up"
   fill_in 'First name', :with => "Chuck"
   fill_in 'Last name', :with => "Norris"
   fill_in 'Email', :with => "chuck.norris@gmail.com"
   fill_in 'City', :with => "city"
   fill_in 'State', :with => "state"
   fill_in 'Password', :with => "password"
   fill_in 'Password confirmation', :with => "password"
   click_button "Sign up"
   #The following fields should be displayed on the profile page
   expect(page).to have_content "Welcome! You have signed up successfully."
   expect(page).to have_content "Chuck Norris"

     #page is currently routing to the index file on completion. we should re-route to the profile page.
 end

 it "should let an existing user log in and direct them to their profile page" do
   #get user into database
   visit "/users/sign_up"
   fill_in 'First name', :with => "Chuck"
   fill_in 'Last name', :with => "Norris"
   fill_in 'Email', :with => "chuck.norris@gmail.com"
   fill_in 'City', :with => "city"
   fill_in 'State', :with => "state"
   fill_in 'Password', :with => "password"
   fill_in 'Password confirmation', :with => "password"
   click_button "Sign up"
   #log out so we can test log in of existing user
   click_link "Logout"
   visit "/users/sign_in"
   fill_in "Email", :with => "chuck.norris@gmail.com"
   fill_in 'Password', :with => "password"
   click_button "Log in"
   #The following fields should be displayed on the profile page
   expect(page).to have_content "Signed in successfully."
   expect(page).to have_content "Chuck Norris"
   #depeding on what the page ends up looking like we may want to add something else to make sure it's the profile page. Maybe?
 end
end
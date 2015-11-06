require 'rails_helper'

describe "user sign up and log in" do
 it "should sign up a new user and direct them to their new profile page" do
   visit "/user/sign_up"
   fill_in 'First Name', :with => "Chuck"
   fill_in 'Last Name', :with => "Norris"
   fill_in 'Email', :with => "chuck.norris@gmail.com"
   fill_in 'City', :with => "city"
   fill_in 'State', :with => "state"
   fill_in 'Password', :with => "password"
   fill_in 'Password confirmation', :with => "password"
   click_button "Sign up"
   #The following fields should be displayed on the profile page
   expect(page).to have_content "Chuck"
   expect(page).to have_content "Norris"
   expect(page).to have_content "city"
   expect(page).to have_content "state"
   #depeding on what the page ends up looking like we may want to add something else to make sure it's the profile page. Maybe?
 end

 it "should let an existing user log in and direct them to their profile page" do
   #get user into database
   visit "/user/sign_up"
   fill_in 'First Name', :with => "Chuck"
   fill_in 'Last Name', :with => "Norris"
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
   click_button "Sign up"
   #The following fields should be displayed on the profile page
   expect(page).to have_content "Chuck"
   expect(page).to have_content "Norris"
   expect(page).to have_content "city"
   expect(page).to have_content "state"
   #depeding on what the page ends up looking like we may want to add something else to make sure it's the profile page. Maybe?
 end
end
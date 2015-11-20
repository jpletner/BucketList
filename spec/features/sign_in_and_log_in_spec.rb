require_relative '../rails_helper'

include Capybara::DSL
describe "user sign up and log in" do
  before(:each) do
    visit "/users/sign_up"
    within('.my_box_center') do
      fill_in 'First name', :with => "Chuck"
      fill_in 'Last name', :with => "Norris"
      fill_in 'Email', :with => "chuck@gmail.com"
      fill_in 'City', :with => "city"
      fill_in 'State', :with => "state"
      fill_in 'Password', :with => "password"
      fill_in 'Password confirmation', :with => "password"
      click_button "Sign up"
    end
  end
 it "should sign up a new user and direct them to their new profile page" do
   #The following fields should be displayed on the profile page
   within('.box') do
     expect(page).to have_content "Chuck Norris"
     expect(page).to have_content "city"
     expect(page).to have_content "state"
   end
 end

 it "should let an existing user log in and direct them to their profile page" do
   #log out so we can test log in of existing user
   within('.dropdown') do
     click_link "Profile"
     click_link "Logout"
   end
   visit "/users/sign_in"
   within('.my_box_center') do
     fill_in "Email", :with => "chuck@gmail.com"
     fill_in "Password", :with => "password"
     click_button "Log in"
   end
   #The following fields should be displayed on the profile page
   within('.box') do
     expect(page).to have_content "Chuck Norris"
     expect(page).to have_content "city"
     expect(page).to have_content "state"
   end
   #depeding on what the page ends up looking like we may want to add something else to make sure it's the profile page. Maybe?
 end
end

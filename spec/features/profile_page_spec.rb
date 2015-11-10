require_relative '../rails_helper'

include Capybara::DSL
describe "user profile page" do
  it "user should have a profile page that includes my info and interests" do
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
   expect(page).to have_content "Chuck Norris"
   expect(page).to have_content "city"
   expect(page).to have_content "state"
  end

it "user should be able to add adventures and view them" do
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
   click_link 'Edit Profile'
   fill_in 'About', :with => "interests"
   fill_in 'Current password', :with => "password"
   click_button "Update"
   expect(page).to have_content "interests"
   fill_in 'Adventure Name', :with => "sky diving"
   fill_in 'Description', :with => "I love sky diving"
   fill_in 'Due Date', :with => "12" "20" "2015"    
   attach_file('adventure[image]', fixture_image_path)
   click_button "Add"
   expect(page).to have_content "sky diving"
   expect(page).to have_content "I love sky diving"
   expect(page).to have_xpath('//img[contains(@src,"ruby.jpg")]')
end
     #page is currently routing to the index file on completion. we should re-route to the profile page.
 end

##create path to test image
def fixture_image_path
    Rails.root.join('spec', 'support', 'ruby.jpg')
end

##before(:each) do code in here end
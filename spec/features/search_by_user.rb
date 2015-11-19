require_relative '../rails_helper'

include Capybara::DSL
describe "search for user" do
  before(:each) do
    visit "/users/sign_up"
      within('.my_box_center') do
       fill_in 'First name', :with => "Jackie"
       fill_in 'Last name', :with => "Chan"
       fill_in 'Email', :with => "jackie@gmail.com"
       fill_in 'City', :with => "city"
       fill_in 'State', :with => "state"
       fill_in 'Password', :with => "password"
       fill_in 'Password confirmation', :with => "password"
       click_button "Sign up"
     end
  end

  it "by name and return results" do
   visit "/users/search_users"
   within('container') do
     fill_in "user", :with => "Jackie"
     click_button "Search"
   end
   within('row') do
     expect(page).to have_content "Jackie Chan"
   end
 end

  it "return something if no users found" do
      visit "/users/search_users"
      within('container') do
        fill_in "user", :with => "random"
        click_button "Search"
      end
      within('row') do
        expect(page).to have_content "No Users Found"
      end
   end
 end

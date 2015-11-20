require_relative '../rails_helper'

include Capybara::DSL

describe "user profile page" do
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
    within('.dropdown') do
      click_link "Profile"
      click_link "Edit Your Profile"
    end
    within('edit_user') do
      fill_in 'About', :with => "Doing the thing, Zhu Li"
      fill_in 'Current password', :with => "password"
      click_button "Update"
    end
  end

  it "user should have a profile page that includes my info and interests" do
   #log out so we can test log in of existing user
   visit "/users/sign_in"
   within('.box') do
     expect(page).to have_content "Chuck Norris"
     expect(page).to have_content "city"
     expect(page).to have_content "state"
   end
  end

  it "should be able to add adventures and view them" do
   within('.row') do
     expect(page).to have_content "Doing the thing, Zhu Li"
     fill_in 'Adventure Name', :with => "sky diving"
     fill_in 'Description', :with => "I love sky diving"
     fill_in 'Due Date', :with => "12" "20" "2015"
     attach_file('adventure[image]', fixture_image_path)
     click_button "Add"
   end
   within('.bucket') do
     expect(page).to have_content "SKY DIVING"
     expect(page).to have_content "Chuck Norris"
     expect(page).to have_content "Show"
     expect(page).to have_content "Edit"
     expect(page).to have_content "Dump"
     expect(page).to have_xpath('//img[contains(@src,"ruby.jpg")]')
   end
  end

  it "should be able to add image from URL" do
    within('.row') do
     fill_in 'Adventure Name', :with => "sky diving"
     fill_in 'Description', :with => "I love sky diving"
     fill_in 'Due Date', :with => "12" "20" "2015"
     within('.fileinputs') do
         choose('#rdb1')
     end
     fill_in 'image_url', :with => 'http://michaeldanielho.com/fish237.jpg'
     click_button "Add"
    end
    within('.bucket') do
     expect(page).to have_content "SKY DIVING"
     expect(page).to have_content "Chuck Norris"
     expect(page).to have_content "Show"
     expect(page).to have_content "Edit"
     expect(page).to have_content "Dump"
     expect(page).to have_selector 'img'
    end
  end

  it "should display a placeholder image if not images are added" do
    within('.bucket') do
     expect(page).to have_xpath('//img[contains(@src,"person-placeholder.jpg")]')
    end
  end
end

##create path to test image
def fixture_image_path
    Rails.root.join('spec', 'support', 'ruby.jpg')
end

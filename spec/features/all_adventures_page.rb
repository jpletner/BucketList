require_relative '../rails_helper'

include Capybara::DSL
describe "all adventures page" do
  before(:each) do
    #create user and adventure
    visit "/users/sign_up"
    within('.my_box_center') do
      fill_in 'First name', :with => "Chuck"
      fill_in 'Last name', :with => "Norris"
      fill_in 'Email', :with => "chuck.norris@gmail.com"
      fill_in 'City', :with => "city"
      fill_in 'State', :with => "state"
      fill_in 'Password', :with => "password"
      fill_in 'Password confirmation', :with => "password"
      click_button "Sign up"
    end
    #create adventure
    within('.row') do
      expect(page).to have_content "Doing the thing, Zhu Li"
      fill_in 'Adventure Name', :with => "sky diving"
      fill_in 'Description', :with => "I love sky diving"
      fill_in 'Due Date', :with => "12" "20" "2015"
      attach_file('adventure[image]', fixture_image_path)
      click_button "Add"
    end
    within('.dropdown') do
      click_link "Adventures"
      click_link "View All Adventures!"
    end
  end

  it "should have a unique link in the modal div in the 'View This Aventure' link" do
    within(".modal-body")do
      expect(page).to have_xpath('//img[contains(@src,"ruby.jpg")]')
      expect(page).to have_content "SKY DIVING"
      expect(page).to have_content "I love sky diving"
      expect(page).to have_content "Jackie Chan"
      expect(page).to have_content "View This Adventure"
    end
  end
end

  def fixture_image_path
      Rails.root.join('spec', 'support', 'ruby.jpg')
  end

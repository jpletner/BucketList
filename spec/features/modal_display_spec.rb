require_relative '../rails_helper'

include Capybara::DSL
describe "search by adventure name" do
  before(:each) do
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
    visit "/adventures"
  end

    it "should have a unique link in the modal div in the 'View This Aventure' link" do
      within(".modal-body")do
        expect(page).to have_xpath('//img[contains(@src,"ruby.jpg")]')
        expect(page).to have_content "MyString"
        expect(page).to have_content "MyText"
        expect(page).to have_content "MyCreator"
        expect(page).to have_content "View This Adventure"
      end
    end
  end

  def fixture_image_path
      Rails.root.join('spec', 'support', 'ruby.jpg')
  end

require_relative '../rails_helper'

include Capybara::DSL
describe "search by adventure name" do
  it "should be able to add and display a profile picture from file" do
    #current user
    visit "/users/sign_up"
    fill_in 'First name', :with => "Donnie"
    fill_in 'Last name', :with => "Yen"
    fill_in 'Email', :with => "donnie@yahoo.com"
    fill_in 'City', :with => "city"
    fill_in 'State', :with => "state"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"

    visit '/users/show'
    expect(page).to have_content "Edit Picture"
    find('#user_pic').click
    within('.radio-buttons') do
      choose "Upload Image from Local Drive"
      attach_file('user_image', fixture_image_path)
      click_button "Add"
    end
    visit '/users/show'
    expect(page).to have_no_xpath('//img[contains(@src,"ruby.jpg")]')
  end

  it "should be able to add and display a profile picture from URL" do
    #current user
    visit "/users/sign_up"
    fill_in 'First name', :with => "Donnie"
    fill_in 'Last name', :with => "Yen"
    fill_in 'Email', :with => "donnie@yahoo.com"
    fill_in 'City', :with => "city"
    fill_in 'State', :with => "state"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"
    visit '/users/show'
    expect(page).to have_content "Edit Picture"
    find('#user_pic').click
    within('.radio-buttons') do
      choose "Upload Image Using a URL"
      fill_in "#profile-url-field", :with => "http://wallfor.net/wp-content/uploads/2015/03/1731_jackie_chan.jpg"
      click_button "Add"
    end
    visit '/users/show'
    expect(page).to have_no_xpath('//img[contains(@src,"/system/users/images/000/000/008/med/open-uri20151117-3994-mj35nx?1447790474")]')
  end
end

def fixture_image_path
  Rails.root.join('spec', 'support', 'ruby.jpg')
end

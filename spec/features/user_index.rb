require 'rails_helper'


describe "User index page" do
  it "should show all users to signed-in users" do
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
    visit '/users/all'
    expect(page).to have_content('All Users')
    within('.user-pic') do
      expect(page).to have_content('Chuck Norris')
    end
  end
end

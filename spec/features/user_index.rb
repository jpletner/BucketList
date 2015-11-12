require 'rails_helper'


describe "User index page" do
  it "should show all users to signed-in users" do
    visit "/users/sign_up"
    fill_in 'First name', :with => "Chuck"
    fill_in 'Last name', :with => "Norris"
    fill_in 'Email', :with => "chuck.norris@gmail.com"
    fill_in 'City', :with => "city"
    fill_in 'State', :with => "state"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"
    visit '/users/all'
    expect(page).to have_content('All Users')
    expect(page).to have_selector('li', text: 'Chuck Norris')
    end
end

require_relative '../rails_helper'

include Capybara::DSL
describe "search by adventure name" do
  before(:each) do
    #current user
    visit "/users/sign_up"
    fill_in 'First name', :with => "Jacie"
    fill_in 'Last name', :with => "Chan"
    fill_in 'Email', :with => "jackie@gmail.com"
    fill_in 'City', :with => "city"
    fill_in 'State', :with => "state"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"
  end

  it "should have a follow button on another users page" do
    u1 = User.new
    u1.first_name = "Chuck"
    u1.last_name = "Norris"
    u1.email = "chuck.norris@gmail.com"
    u1.city = "city"
    u1.state = "state"
    u1.password = "password"
    u1.save!

    chuck = u1.id
    visit "/users/#{chuck}"
    expect(page). to have_content "Follow"
  end

  it "should have an unfollow button on another users page when you follow them" do
    u1 = User.new
    u1.first_name = "Chuck"
    u1.last_name = "Norris"
    u1.email = "chuck.norris@gmail.com"
    u1.city = "city"
    u1.state = "state"
    u1.password = "password"
    u1.save!

    chuck = u1.id
    visit "/users/#{chuck}"
    click_link "Follow"
    expect(page). to have_content "Unfollow"
  end

  it "should display a person you've followed in the follow page" do
    u1 = User.new
    u1.first_name = "Chuck"
    u1.last_name = "Norris"
    u1.email = "chuck.norris@gmail.com"
    u1.city = "city"
    u1.state = "state"
    u1.password = "password"
    u1.save!

    chuck = u1.id
    visit "/users/#{chuck}"
    click_link "Follow"
    click_link "View Follow"
    expect(page). to have_content "Chuck Norris"
  end

  it "should not display a person once you've unfollowed them" do
    u1 = User.new
    u1.first_name = "Chuck"
    u1.last_name = "Norris"
    u1.email = "chuck.norris@gmail.com"
    u1.city = "city"
    u1.state = "state"
    u1.password = "password"
    u1.save!

    chuck = u1.id
    visit "/users/#{chuck}"
    click_link "Follow"
    click_link "View Follow"
    expect(page).to have_content "Chuck Norris"

    visit "/users/#{chuck}"
    click_link "Unfollow"
    click_link "View Follow"
    expect(page).to_not have_content "Chuck Norris"

  end

end

require_relative '../rails_helper'

include Capybara::DSL
describe "search by adventure name" do
  before(:each) do
    #current user
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
    within('user-pic') do
      expect(page). to have_content "Follow"
    end
  end

  it "should have an unfollow button on another users page after you follow them" do
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
    within('.user-pic') do
      click_link "Follow"
    end
    within('.user-pic') do
      expect(page).to have_content "Unfollow"
    end
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
    within('.user-pic') do
      click_link "Follow"
    end
    find('.navbar_brand').click
    within('.my_box_center_mod') do
      expect(page).to have_content "Chuck Norris"
    end
  end

  it "should display a person who is following you on the follow page" do
    visit '/users/show'
    within('.dropdown') do
      click_link "Profile"
      click_link "Logout"
    end
    #sign up another user
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
    #go and follow Jackie Chan
    visit "/users/all"
    within('.all_users') do
      click_link "Jackie Chan"
    end
    within('user-pic') do
      expect(page). to have_content "Follow"
    end
    within('.dropdown') do
      click_link "Profile"
      click_link "Logout"
    end
    #sign back in as Jackie
    visit "/users/sign_in"
    within('.my_box_center') do
      fill_in "Email", :with => "jackie@gmail.com"
      fill_in "Password", :with => "password"
      click_button "Log in"
    end
    within('.user-pic') do
      expect(page).to have_content "Jackie Chan"
    end
    find('.navbar_brand').click
    within('.my_box_center_mod') do
      expect(page).to have_content "Chuck Norris"
    end
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
    within('.user-pic') do
      click_link "Follow"
    end
    find('.navbar_brand').click
    within('.my_box_center_mod') do
      expect(page).to have_content "Chuck Norris"
    end

    visit "/users/#{chuck}"
    within('user-pic') do
      click_link "Unfollow"
    end
    find('.navbar_brand').click
    within('.my_box_center_mod') do
      expect(page).to_not have_content "Chuck Norris"
    end
  end
end

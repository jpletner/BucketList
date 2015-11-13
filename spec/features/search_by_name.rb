require_relative '../rails_helper'

include Capybara::DSL
describe "search for user" do
 it "by name and return results" do
   visit "/users/sign_up"
   fill_in 'First name', :with => "Chuck"
   fill_in 'Last name', :with => "Norris"
   fill_in 'Email', :with => "chuck.norris@gmail.com"
   fill_in 'City', :with => "city"
   fill_in 'State', :with => "state"
   fill_in 'Password', :with => "password"
   fill_in 'Password confirmation', :with => "password"
   click_button "Sign up"

   visit "/users/search_users"
        fill_in "user", :with => "Chuck"
       click_button "creator"
       expect(page).to have_content "Chuck"


   end

    it "return something if no users found" do
         visit "/users/sign_up"
         fill_in 'First name', :with => "Chuck"
         fill_in 'Last name', :with => "Norris"
         fill_in 'Email', :with => "chuck.norris@gmail.com"
         fill_in 'City', :with => "city"
         fill_in 'State', :with => "state"
         fill_in 'Password', :with => "password"
         fill_in 'Password confirmation', :with => "password"
         click_button "Sign up"

        visit "/users/search_users"
        fill_in "user", :with => "yabba"
        click_button "creator"
        expect(page).to have_content "No People Found"

     end
   
 end




# describe "search for user" do
#   before(:each) do
#     bUser = User.new
#     bUser.first_name = "MyName"
#     bUser.last_name = "MyOtherName"
#     bUser.email = "my.na"
#     bUser.password = ""
#     bUser.save
#   end
#
#   it "should search for users by name return results" do
#     visit "/users/search_users"
#     fill_in "name", :with => "MyName"
#     click_button "creator"
#     expect(page).to have_content "MyName"
#   end
#
#   it "should search for users by name and return somthing if it is not found" do
#     visit "/users/search_users"
#     fill_in "c", :with => "asdj"
#     click_button "creator"
#     expect(page).to have_content "No Users Found"
#   end
#
#
# end

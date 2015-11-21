require_relative '../rails_helper'

include Capybara::DSL
describe "search by adventure name" do
  before(:each) do
    @bAdventure = Adventure.new
    @bAdventure.title = "MyString"
    @bAdventure.description = "MyText"
    @bAdventure.creator = "MyString"
    @bAdventure.priority = 1,
    @bAdventure.completed = false
    @bAdventure.save
  end

  it "should accept a comment and display it" do
    visit "/adventures/" + @bAdventure.id.to_s
    within('.my_adventure_comment_form') do
      expect(page).to have_content "Be the first to comment on this adventure"
      fill_in "Add A Comment For This Adventure", :with => "newString!@#"
      click_button "Add Comment"
      fill_in "Add A Comment For This Adventure", :with => "blahString!@#"
      click_button "Add Comment"
    end
    within('.my_adventure_comments') do
      expect(page).to have_content "newString!@#"
      expect(page).to have_content "blahString!@#"
    end
  end




end

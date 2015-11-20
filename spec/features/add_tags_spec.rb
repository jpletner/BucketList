require_relative '../rails_helper'

include Capybara::DSL
describe "search by adventure name" do
  before(:each) do
    @cAdventure = Adventure.new
    @cAdventure.title = "MyString"
    @cAdventure.description = "MyText"
    @cAdventure.creator = "MyString"
    @cAdventure.priority = 1,
    @cAdventure.completed = false
    @cAdventure.save
  end

  it "should accept a tag and display it" do
    visit "adventures/" + @cAdventure.id.to_s
    within('.my_adventure_tags_box_') do
      expect(page).to have_content "Be the first to tag this adventure"
      fill_in "Add A Tag For This Adventure", :with => "Party!@#"
      click_button "Add Tag"
      fill_in "Add A Tag For This Adventure", :with => "Animals!@#"
      click_button "Add Tag"
      expect(page).to have_content "Party!@#"
      expect(page).to have_content "Animals!@#"
    end

  end




end

require_relative '../rails_helper'

include Capybara::DSL

describe "search by adventure name" do
  before(:each) do
    bAdventure = Adventure.new
    bAdventure.title = "MyString"
    bAdventure.description = "MyText"
    bAdventure.creator = "MyString"
    bAdventure.priority = 1,
    bAdventure.completed = false
    bAdventure.save
  end

  it "should search for adventures by title and return results" do
    visit "/adventures/search_adventures"
    within('.container') do
      fill_in "Search Buckets", :with => "MyString"
      click_button "Search"
    end
    within('.row') do
      expect(page).to have_content "MyString"
    end
  end

  it "should search for adventures by title return somthing if it is not found" do
    visit "/adventures/search_adventures"
    within('.container') do
      fill_in "Search Buckets", :with => "random"
      click_button "Search"
    end
    within('.row') do
      expect(page).to have_content "No Buckets Found"
    end
  end
end

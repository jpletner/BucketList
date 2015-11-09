require_relative '../rails_helper'

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

  it "should search for adventures by title return results" do
    visit "/adventures/search_adventures"
    fill_in "adventure_title", :with => "MyString"
    click_button "Search"
    expect(page).to have_content "MyString"
  end

  it "should search for adventures by title return somthing if it is not found" do
    visit "/adventures/search_adventures"
    fill_in "adventure_title", :with => "asdj"
    click_button "Search"
    expect(page).to have_content "No Adventures Found"
  end


end

require_relative '../rails_helper'

RSpec.describe Adventure, type: :model do
  it "should have a title (bucket list item)" do
    anAdventure = Adventure.new
    anAdventure.title = "skydiving"
    expect(anAdventure.title).to eq "skydiving"
  end

  it " should have a description" do
    adventure = Adventure.new
    adventure.description = "jumping out of an airplane"
    expect(adventure.description).to eq "jumping out of an airplane"
  end

  it " should have a due date" do
    anAdventure = Adventure.new
    myDate = Date.new
    anAdventure.duedate = myDate
    expect(anAdventure.duedate).to eq myDate
  end

  it "an adventure should have a creator" do
    adventure = Adventure.new
    adventure.creator = "Del"
    expect(adventure.creator).to eq "Del"
  end

  it "should have a priority (maybe)" do
    adventure = Adventure.new
    adventure.priority = 3
    expect(adventure.priority).to eq 3
  end

  it "should be completed (maybe)" do
    adventure = Adventure.new
    adventure.completed = false
    # expect(adventure.completed).to eq true
    expect(adventure.completed).to eq false
  end

  it "should have a comment" do
    adventure = Adventure.new
    comment1 = "party"
    comment2 = "time"
    adventure.comments << comment1
    adventure.comments << comment2
    expect(adventure.comments).to eq ["party", "time"]
  end

  it "should have a tag" do
    adventure = Adventure.new
    tag1 = "fun"
    tag2 = "times"
    adventure.tags << tag1
    adventure.tags << tag2
    expect(adventure.tags).to eq ["fun", "times"]
  end

  it "should have an image" do
    adventure = Adventure.new
    image = "http://michaeldanielho.com/fish237.jpg"
    adventure.image = image
    expect(adventure.image_file_name).to eq "fish237.jpg"
  end
end

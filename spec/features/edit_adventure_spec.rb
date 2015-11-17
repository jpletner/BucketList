require_relative '../rails_helper'

include Capybara::DSL
describe "edit adventure" do
  before(:each) do
    @bAdventure = Adventure.new
    @bAdventure.title = "MyString"
    @bAdventure.description = "MyText"
    @bAdventure.creator = "MyString"
    @bAdventure.priority = 1,
    @bAdventure.completed = false
    @bAdventure.save
  end

  it "should be able to edit an adventure" do
    visit "adventures/" + @bAdventure.id.to_s + "/edit"
    expect(page).to have_content "Edit Your Adventure"
    fill_in "Title", :with => "newTitle!@#"
    attach_file("photos[]", fixture_image_path)
    fill_in "Description", :with => "newDescription!@#"
    click_button "Update Adventure"
    expect(page).to have_content "newTitle!@#"
    expect(page).to have_content "newDescription!@#"
    expect(page).to have_xpath('//img[contains(@src,"ruby.jpg")]')
  end
    

  it "should be able to delete an image" do
    visit "adventures/" + @bAdventure.id.to_s + "/edit"
    expect(page).to have_content "Edit Your Adventure"
    fill_in "Title", :with => "newTitle!@#"
    fill_in "Description", :with => "newDescription!@#"
    attach_file("photos[]", fixture_image_path)
    within('.inline-div') do
        find('#destroy-image').click_link('Destroy')
    end
    expect(page).to have_content "Edit Your Adventure"
    expect(page).to have_no_xpath('//img[contains(@src,"ruby.jpg")]')
  end
    
  it "should be able to replace the main image" do
    visit "adventures/" + @bAdventure.id.to_s + "/edit"
    expect(page).to have_content "Edit Your Adventure"
    fill_in "Title", :with => "newTitle!@#"
    fill_in "Description", :with => "newDescription!@#"
    attach_file('adventure[image]', fixture_image_path)
    click_button "Update Adventure"
    expect(page).to have_xpath('//img[contains(@src,"ruby.jpg")]')
  end
end


def fixture_image_path
  Rails.root.join('spec', 'support', 'ruby.jpg')
end
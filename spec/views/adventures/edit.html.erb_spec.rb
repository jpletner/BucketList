require 'rails_helper'

RSpec.describe "adventures/edit", type: :view do
  before(:each) do
    @adventure = assign(:adventure, Adventure.create!(
      :title => "MyString",
      :description => "MyText",
      :creator => "MyString",
      :priority => 1,
      :completed => false
    ))
  end

  it "renders the edit adventure form" do
    render

    assert_select "form[action=?][method=?]", adventure_path(@adventure), "post" do

      assert_select "input#adventure_title[name=?]", "adventure[title]"

      assert_select "textarea#adventure_description[name=?]", "adventure[description]"

      assert_select "input#adventure_creator[name=?]", "adventure[creator]"

      assert_select "input#adventure_priority[name=?]", "adventure[priority]"

      assert_select "input#adventure_completed[name=?]", "adventure[completed]"
    end
  end
end

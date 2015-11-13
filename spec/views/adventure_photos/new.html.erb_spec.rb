require 'rails_helper'

RSpec.describe "adventure_photos/new", type: :view do
  before(:each) do
    assign(:adventure_photo, AdventurePhoto.new(
      :adventure_id => 1
    ))
  end

  it "renders new adventure_photo form" do
    render

    assert_select "form[action=?][method=?]", adventure_photos_path, "post" do

      assert_select "input#adventure_photo_adventure_id[name=?]", "adventure_photo[adventure_id]"
    end
  end
end

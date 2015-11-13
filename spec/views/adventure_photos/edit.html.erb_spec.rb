require 'rails_helper'

RSpec.describe "adventure_photos/edit", type: :view do
  before(:each) do
    @adventure_photo = assign(:adventure_photo, AdventurePhoto.create!(
      :adventure_id => 1
    ))
  end

  it "renders the edit adventure_photo form" do
    render

    assert_select "form[action=?][method=?]", adventure_photo_path(@adventure_photo), "post" do

      assert_select "input#adventure_photo_adventure_id[name=?]", "adventure_photo[adventure_id]"
    end
  end
end

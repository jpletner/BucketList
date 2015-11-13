require 'rails_helper'

RSpec.describe "adventure_photos/index", type: :view do
  before(:each) do
    assign(:adventure_photos, [
      AdventurePhoto.create!(
        :adventure_id => 1
      ),
      AdventurePhoto.create!(
        :adventure_id => 1
      )
    ])
  end

  it "renders a list of adventure_photos" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

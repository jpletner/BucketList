require 'rails_helper'

RSpec.describe "adventure_photos/show", type: :view do
  before(:each) do
    @adventure_photo = assign(:adventure_photo, AdventurePhoto.create!(
      :adventure_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end

require 'rails_helper'

RSpec.describe "adventures/show", type: :view do
  before(:each) do
    @adventure = assign(:adventure, Adventure.create!(
      :title => "Title",
      :description => "MyText",
      :creator => "Creator",
      :priority => 1,
      :completed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Creator/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
  end
end

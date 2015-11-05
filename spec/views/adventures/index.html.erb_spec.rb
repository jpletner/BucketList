require 'rails_helper'

RSpec.describe "adventures/index", type: :view do
  before(:each) do
    assign(:adventures, [
      Adventure.create!(
        :title => "Title",
        :description => "MyText",
        :creator => "Creator",
        :priority => 1,
        :completed => false
      ),
      Adventure.create!(
        :title => "Title",
        :description => "MyText",
        :creator => "Creator",
        :priority => 1,
        :completed => false
      )
    ])
  end

  it "renders a list of adventures" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Creator".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

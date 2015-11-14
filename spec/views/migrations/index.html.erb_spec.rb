require 'rails_helper'

RSpec.describe "migrations/index", type: :view do
  before(:each) do
    assign(:migrations, [
      Migration.create!(
        :addPaperclipToPictures => "Add Paperclip To Pictures"
      ),
      Migration.create!(
        :addPaperclipToPictures => "Add Paperclip To Pictures"
      )
    ])
  end

  it "renders a list of migrations" do
    render
    assert_select "tr>td", :text => "Add Paperclip To Pictures".to_s, :count => 2
  end
end

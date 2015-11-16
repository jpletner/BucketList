require 'rails_helper'

RSpec.describe "migrations/show", type: :view do
  before(:each) do
    @migration = assign(:migration, Migration.create!(
      :addPaperclipToPictures => "Add Paperclip To Pictures"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Add Paperclip To Pictures/)
  end
end

require 'rails_helper'

RSpec.describe "migrations/edit", type: :view do
  before(:each) do
    @migration = assign(:migration, Migration.create!(
      :addPaperclipToPictures => "MyString"
    ))
  end

  it "renders the edit migration form" do
    render

    assert_select "form[action=?][method=?]", migration_path(@migration), "post" do

      assert_select "input#migration_addPaperclipToPictures[name=?]", "migration[addPaperclipToPictures]"
    end
  end
end

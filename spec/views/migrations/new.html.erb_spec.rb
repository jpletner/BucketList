require 'rails_helper'

RSpec.describe "migrations/new", type: :view do
  before(:each) do
    assign(:migration, Migration.new(
      :addPaperclipToPictures => "MyString"
    ))
  end

  it "renders new migration form" do
    render

    assert_select "form[action=?][method=?]", migrations_path, "post" do

      assert_select "input#migration_addPaperclipToPictures[name=?]", "migration[addPaperclipToPictures]"
    end
  end
end

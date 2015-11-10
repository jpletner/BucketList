class AddPaperclipToRecipe < ActiveRecord::Migration
  def change
      add_attachment :adventure, :image
  end
end

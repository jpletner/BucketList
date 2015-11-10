class AddPaperclipToRecipe < ActiveRecord::Migration
  def change
      add_attachment :adventures, :image
  end
end

class AddPapercliptoAdventurePhotos < ActiveRecord::Migration
  def change
    add_attachment :adventure_photos, :image
  end
end

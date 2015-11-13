class AddForeignKeyToAdventurePhotos < ActiveRecord::Migration
  def change
    remove_column :adventure_photos, :adventure_id, :integer
    add_reference :adventure_photos, :adventure, index: true
    add_foreign_key :adventure_photos, :adventures
  end
end

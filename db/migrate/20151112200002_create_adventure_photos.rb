class CreateAdventurePhotos < ActiveRecord::Migration
  def change
    create_table :adventure_photos do |t|
      t.integer :adventure_id

      t.timestamps null: false
    end
  end
end

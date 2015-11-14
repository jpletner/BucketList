class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
        t.integer :adventure_id
        t.attachment :photo
    
      t.timestamps null: false
    end
  end

  def self.down
    drop_attached_file :pictures, :image
  end    
end

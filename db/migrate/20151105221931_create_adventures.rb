class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :title
      t.text :description
      t.date :duedate
      t.string :creator
      t.integer :priority
      t.boolean :completed

      t.timestamps null: false
    end
  end
end

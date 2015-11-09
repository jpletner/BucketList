class AddForeignKeyToAdventuresTableToAssociateWithUsers < ActiveRecord::Migration
  def change
      add_reference :adventures, :user, index: true
      add_foreign_key :adventures, :users
  end
end

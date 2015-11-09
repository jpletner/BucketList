class AddCommentsColumnToAdvanturesTable < ActiveRecord::Migration
  def change
    add_column :adventures, :comments, :string, array:true, default: []
  end
end

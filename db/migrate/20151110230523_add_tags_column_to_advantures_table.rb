class AddTagsColumnToAdvanturesTable < ActiveRecord::Migration
    def change
      add_column :adventures, :tags, :string, array:true, default: []
    end
end

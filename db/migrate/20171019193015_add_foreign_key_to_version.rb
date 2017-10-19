class AddForeignKeyToVersion < ActiveRecord::Migration[5.1]
  def change
  	add_column :versions, :paper_id, :integer
  end
end

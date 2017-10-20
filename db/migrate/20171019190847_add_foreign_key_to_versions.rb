class AddForeignKeyToVersions < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :versions, :paper
  end
end

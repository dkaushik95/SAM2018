class FixErrorMigration < ActiveRecord::Migration[5.1]
  def change
  	add_column :papers, :status, :string, default: "initial"
  end
end

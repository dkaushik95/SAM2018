class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :paper_id

      t.timestamps
    end
  end
end

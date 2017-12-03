class CreatePaperRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :paper_requests do |t|
      t.integer :user_id
      t.integer :paper_id

      t.timestamps
    end
  end
end

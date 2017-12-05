class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :paper_id
      t.text :review
      t.integer :rating
      t.integer :user_id
      
      t.timestamps
    end
  end
end

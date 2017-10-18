class CreatePapers < ActiveRecord::Migration[5.1]
  def change
    create_table :papers do |t|
      t.string :name
      t.text :author
      t.string :contact
      t.string :format
      t.boolean :isInReview
      t.boolean :isAccepted

      t.timestamps
    end
  end
end

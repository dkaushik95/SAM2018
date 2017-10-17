class CreatePapers < ActiveRecord::Migration[5.1]
  def change
    create_table :papers do |t|
      t.string :name
      t.text :author
      t.boolean :isInReview, default: false
      t.boolean :isAccepted, default: false
      t.string :contact
      t.string :format

      t.timestamps
    end
  end
end

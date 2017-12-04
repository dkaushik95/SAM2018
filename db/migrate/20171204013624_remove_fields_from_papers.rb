class RemoveFieldsFromPapers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :papers, :isInReview
  	remove_column :papers, :isAccepted
  end
end

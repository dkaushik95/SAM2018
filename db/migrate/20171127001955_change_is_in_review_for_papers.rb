class ChangeIsInReviewForPapers < ActiveRecord::Migration[5.1]
  def change
  	change_column :papers, :isInReview, :boolean, default: false
  end
end

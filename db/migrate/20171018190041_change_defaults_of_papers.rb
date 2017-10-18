class ChangeDefaultsOfPapers < ActiveRecord::Migration[5.1]
  def change
    change_column :papers, :isAccepted, :boolean, default: false
    change_column :papers, :isInReview, :boolean, default: false
  end
end

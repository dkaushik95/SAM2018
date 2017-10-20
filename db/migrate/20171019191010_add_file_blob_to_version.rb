class AddFileBlobToVersion < ActiveRecord::Migration[5.1]
  def up
    add_attachment :versions, :document
  end

  def down
    remove_attachment :versions, :document
  end
end

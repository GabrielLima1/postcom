class RemovePhotoFromDesire < ActiveRecord::Migration[5.0]
  def change
    remove_column :desires, :photo, :string
  end
end

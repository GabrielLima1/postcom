class AddPhotoToDesire < ActiveRecord::Migration[5.0]
  def change
    add_column :desires, :photo, :string
  end
end

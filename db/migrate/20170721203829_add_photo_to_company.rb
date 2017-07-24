class AddPhotoToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :photo, :string
  end
end

class AddPageFaceToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :page_face, :string
  end
end

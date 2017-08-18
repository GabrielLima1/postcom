class AddPublicToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :public, :text
  end
end

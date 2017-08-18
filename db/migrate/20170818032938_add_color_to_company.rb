class AddColorToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :color, :string
  end
end

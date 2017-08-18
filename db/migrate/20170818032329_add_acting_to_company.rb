class AddActingToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :acting, :string
  end
end

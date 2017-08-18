class AddProfileInstaToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :profile_insta, :string
  end
end

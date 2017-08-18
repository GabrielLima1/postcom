class AddPlanToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :plan, :integer
    add_column :users, :phone, :string
  end
end

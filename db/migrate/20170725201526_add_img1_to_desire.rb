class AddImg1ToDesire < ActiveRecord::Migration[5.0]
  def change
    add_column :desires, :img1, :string
  end
end

class AddImg2ToDesire < ActiveRecord::Migration[5.0]
  def change
    add_column :desires, :img2, :string
  end
end

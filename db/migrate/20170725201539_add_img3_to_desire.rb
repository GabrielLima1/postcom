class AddImg3ToDesire < ActiveRecord::Migration[5.0]
  def change
    add_column :desires, :img3, :string
  end
end

class AddSizeToDesires < ActiveRecord::Migration[5.0]
  def change
    add_column :desires, :size, :string
  end
end

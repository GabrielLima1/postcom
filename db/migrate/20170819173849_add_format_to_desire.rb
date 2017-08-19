class AddFormatToDesire < ActiveRecord::Migration[5.0]
  def change
    add_column :desires, :format, :integer
  end
end

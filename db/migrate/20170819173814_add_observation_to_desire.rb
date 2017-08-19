class AddObservationToDesire < ActiveRecord::Migration[5.0]
  def change
    add_column :desires, :observation, :text
  end
end

class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.text :message
      t.string :status
      t.references :desire, foreign_key: true

      t.timestamps
    end
  end
end

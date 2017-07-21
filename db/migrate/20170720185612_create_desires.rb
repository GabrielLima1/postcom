class CreateDesires < ActiveRecord::Migration[5.0]
  def change
    create_table :desires do |t|
      t.string :title
      t.string :action
      t.text :description
      t.string :status
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end

class AddImg1ToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :img1, :string
  end
end

class AddImg2ToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :img2, :string
  end
end

class AddImg3ToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :img3, :string
  end
end

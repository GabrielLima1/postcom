class AddNoteToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :note, :text
  end
end

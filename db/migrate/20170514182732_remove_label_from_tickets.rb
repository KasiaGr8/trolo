class RemoveLabelFromTickets < ActiveRecord::Migration[5.0]
  def up
    remove_column :tickets, :label
  end

  def down
    add_column :tickets, :label, :string
  end
end

class AddLabelToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :label, :string
  end
end

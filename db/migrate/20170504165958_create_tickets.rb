class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.integer :list_id

      t.timestamps
    end
  end
end

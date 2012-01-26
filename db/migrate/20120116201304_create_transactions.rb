class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :symbol
      t.boolean :type
      t.integer :shares
      t.string :price

      t.timestamps
    end
  end
end

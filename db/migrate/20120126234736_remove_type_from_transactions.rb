class RemoveTypeFromTransactions < ActiveRecord::Migration
  def up
    remove_column :transactions, :type
  end

  def down
    add_column :transactions, :type, :boolean
  end
end

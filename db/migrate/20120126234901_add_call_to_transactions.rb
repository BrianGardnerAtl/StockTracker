class AddCallToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :call_type, :boolean
  end
end

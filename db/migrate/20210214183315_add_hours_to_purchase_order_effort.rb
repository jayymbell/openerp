class AddHoursToPurchaseOrderEffort < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_order_efforts, :hours, :decimal
  end
end

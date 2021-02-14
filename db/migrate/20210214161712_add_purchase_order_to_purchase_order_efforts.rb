class AddPurchaseOrderToPurchaseOrderEfforts < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchase_order_efforts, :purchase_order
  end
end

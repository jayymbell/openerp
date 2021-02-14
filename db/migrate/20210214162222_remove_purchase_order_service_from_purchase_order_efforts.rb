class RemovePurchaseOrderServiceFromPurchaseOrderEfforts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :purchase_order_efforts, :purchase_order_service
  end
end

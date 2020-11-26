class AddPurchaseOrderToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :purchase_order
  end
end

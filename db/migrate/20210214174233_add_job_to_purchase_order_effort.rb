class AddJobToPurchaseOrderEffort < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchase_order_efforts, :job
  end
end

class AddWorkflowToPurchaseOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchase_orders, :workflow
    add_reference :purchase_orders, :workflow_state
  end
end

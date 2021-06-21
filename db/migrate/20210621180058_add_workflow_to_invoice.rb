class AddWorkflowToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :workflow
    add_reference :invoices, :workflow_state
  end
end

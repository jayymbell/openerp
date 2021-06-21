class AddWorkflowToWorkOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :work_orders, :workflow
    add_reference :work_orders, :workflow_state
  end
end

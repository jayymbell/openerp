class AddEstimateToWorkOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :work_orders, :initial_estimate, :decimal
    add_column :work_orders, :remaining_estimate, :decimal
  end
end

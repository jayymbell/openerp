class AddCompletedOnToWorkOrderEfforts < ActiveRecord::Migration[6.0]
  def change
    add_column :work_order_efforts, :completed_on, :date
  end
end

class AllowNullEmployeePurchaseOrderEfforts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :purchase_order_efforts, :employee_id, true
  end
end

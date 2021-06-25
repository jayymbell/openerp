class AddStartAndEndTimesToPurchaseOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_orders, :starts_on, :date
    add_column :purchase_orders, :ends_on, :date
  end
end

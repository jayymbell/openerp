class AddNameToPurchaseOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_orders, :name, :string
  end
end

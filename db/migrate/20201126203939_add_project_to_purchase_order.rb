class AddProjectToPurchaseOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchase_orders, :project
  end
end

class AddTosFileToPurchaseOrderServices < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_order_services, :tos_file, :binary
    add_column :purchase_order_services, :tos_file_type, :string
  end
end

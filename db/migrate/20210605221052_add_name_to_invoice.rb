class AddNameToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :name, :string
  end
end

class RemoveCustomerFromInvoice < ActiveRecord::Migration[6.0]
  def change
    remove_reference :invoices, :customer
  end
end

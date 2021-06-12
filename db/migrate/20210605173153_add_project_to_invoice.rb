class AddProjectToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :project
  end
end

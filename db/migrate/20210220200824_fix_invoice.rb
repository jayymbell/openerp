class FixInvoice < ActiveRecord::Migration[6.0]
  def up
    remove_column :invoices, :date
    remove_column :invoices, :starts_on
    add_column :invoices, :starts_on, :date
  end
  def down
    add_column :invoices, :date, :string
    remove_column :invoices, :starts_on
    add_column :invoices, :starts_on, :string
  end
end

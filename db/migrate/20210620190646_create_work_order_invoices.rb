class CreateWorkOrderInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :work_order_invoices do |t|
      t.references :work_order, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.decimal :allocation

      t.timestamps
    end
  end
end

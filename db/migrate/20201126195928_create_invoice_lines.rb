class CreateInvoiceLines < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_lines do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :short_description
      t.string :long_description
      t.decimal :total
      t.boolean :is_invoiceable

      t.timestamps
    end
  end
end

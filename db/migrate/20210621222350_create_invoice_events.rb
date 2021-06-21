class CreateInvoiceEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_events do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :action
      t.references :actor, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

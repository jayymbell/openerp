class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :starts_on
      t.string :date
      t.date :ends_on
      t.decimal :total

      t.timestamps
    end
  end
end

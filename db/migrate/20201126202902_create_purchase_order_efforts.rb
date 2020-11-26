class CreatePurchaseOrderEfforts < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_order_efforts do |t|
      t.references :purchase_order_service, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end

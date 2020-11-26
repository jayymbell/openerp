class CreatePurchaseOrderServices < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_order_services do |t|
      t.references :purchase_order, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end

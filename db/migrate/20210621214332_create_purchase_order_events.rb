class CreatePurchaseOrderEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_order_events do |t|
      t.references :purchase_order, null: false, foreign_key: true
      t.string :action
      t.references :actor, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

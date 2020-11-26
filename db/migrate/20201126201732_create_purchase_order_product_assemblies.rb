class CreatePurchaseOrderProductAssemblies < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_order_product_assemblies do |t|
      t.references :purchase_order, null: false, foreign_key: true
      t.references :product_assembly, null: false, foreign_key: true
      t.decimal :quantity
      t.decimal :total

      t.timestamps
    end
  end
end

class CreateProductAssemblyComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :product_assembly_components do |t|
      t.references :product_assembly, null: false, foreign_key: true
      t.references :component, null: false, foreign_key: true
      t.decimal :quantity
      t.decimal :cost
      t.decimal :margin

      t.timestamps
    end
  end
end

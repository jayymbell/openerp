class CreateProductAssemblies < ActiveRecord::Migration[6.0]
  def change
    create_table :product_assemblies do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :is_active

      t.timestamps
    end
  end
end

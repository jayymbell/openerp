class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.string :name
      t.text :description
      t.decimal :quantity
      t.decimal :cost
      t.boolean :is_active

      t.timestamps
    end
  end
end

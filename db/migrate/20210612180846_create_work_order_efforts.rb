class CreateWorkOrderEfforts < ActiveRecord::Migration[6.0]
  def change
    create_table :work_order_efforts do |t|
      t.references :work_order, null: false, foreign_key: true
      t.string :short_description
      t.text :long_description
      t.references :employee, null: false, foreign_key: true
      t.decimal :hours

      t.timestamps
    end
  end
end

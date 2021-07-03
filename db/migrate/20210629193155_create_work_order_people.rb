class CreateWorkOrderPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :work_order_people do |t|
      t.references :work_order, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end

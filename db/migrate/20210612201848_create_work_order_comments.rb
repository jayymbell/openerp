class CreateWorkOrderComments < ActiveRecord::Migration[6.0]
  def change
    create_table :work_order_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :work_order, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end

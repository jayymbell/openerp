class CreateProjectCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :project_customers do |t|
      t.references :project, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.boolean :is_active

      t.timestamps
    end
  end
end

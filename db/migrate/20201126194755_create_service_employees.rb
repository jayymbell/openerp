class CreateServiceEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :service_employees do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.boolean :is_active
      t.boolean :is_primary

      t.timestamps
    end
  end
end

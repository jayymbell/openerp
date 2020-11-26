class CreateEmployeeDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_departments do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.boolean :is_active

      t.timestamps
    end
  end
end

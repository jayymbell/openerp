class CreateProjectEmployeeRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :project_employee_roles do |t|
      t.references :project_employee, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.boolean :is_active

      t.timestamps
    end
  end
end

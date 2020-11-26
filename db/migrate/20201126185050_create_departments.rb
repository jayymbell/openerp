class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.text :description
      t.boolean :is_active
      t.references :parent_department, index: true, foreign_key: { to_table: :departments }

      t.timestamps
    end
  end
end

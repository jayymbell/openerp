class CreateWorkflows < ActiveRecord::Migration[6.0]
  def change
    create_table :workflows do |t|
      t.string :name
      t.text :description
      t.string :category
      t.boolean :is_active

      t.timestamps
    end
  end
end

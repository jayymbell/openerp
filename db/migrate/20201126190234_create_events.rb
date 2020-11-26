class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :category
      t.string :name
      t.text :description
      t.boolean :is_active

      t.timestamps
    end
  end
end

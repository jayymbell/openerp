class CreateServiceActions < ActiveRecord::Migration[6.1]
  def change
    create_table :service_actions do |t|
      t.references :service, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end

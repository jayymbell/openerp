class CreateCustomerOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_organizations do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.boolean :is_active

      t.timestamps
    end
  end
end

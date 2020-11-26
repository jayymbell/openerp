class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.references :person, null: false, foreign_key: true
      t.string :activation_digest
      t.datetime :activation_sent_at
      t.datetime :activation_at
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.datetime :reset_at
      t.string :password_digest
      t.boolean :is_active

      t.timestamps
    end
  end
end

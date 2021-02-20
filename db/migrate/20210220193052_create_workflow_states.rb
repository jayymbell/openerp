class CreateWorkflowStates < ActiveRecord::Migration[6.0]
  def change
    create_table :workflow_states do |t|
      t.references :workflow, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :is_start

      t.timestamps
    end
  end
end

class CreateWorkflowTransitions < ActiveRecord::Migration[6.0]
  def change
    create_table :workflow_transitions do |t|
      t.references :workflow, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.references :source_state, null: false, foreign_key: { to_table: 'workflow_states' }
      t.references :target_state, null: false, foreign_key: { to_table: 'workflow_states' }

      t.timestamps
    end
  end
end

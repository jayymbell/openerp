class CreateWorkflowTransitionRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :workflow_transition_roles do |t|
      t.references :workflow_transition, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end

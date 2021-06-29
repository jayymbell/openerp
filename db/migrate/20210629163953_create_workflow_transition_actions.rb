class CreateWorkflowTransitionActions < ActiveRecord::Migration[6.1]
  def change
    create_table :workflow_transition_actions do |t|
      t.references :workflow_transition, null: false, foreign_key: true
      t.references :service_action, null: false, foreign_key: true

      t.timestamps
    end
  end
end

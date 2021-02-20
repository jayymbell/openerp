class WorkflowTransition < ApplicationRecord
  belongs_to :workflow
  belongs_to :source_state
  belongs_to :target_state
end

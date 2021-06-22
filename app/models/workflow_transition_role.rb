class WorkflowTransitionRole < ApplicationRecord
  belongs_to :workflow_transition
  belongs_to :role
end

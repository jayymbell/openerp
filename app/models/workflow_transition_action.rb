class WorkflowTransitionAction < ApplicationRecord
  belongs_to :workflow_transition
  belongs_to :service_action
end

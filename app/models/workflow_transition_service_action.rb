 class WorkflowTransitionServiceAction < ApplicationRecord
  self.table_name = "workflow_transition_actions"
  belongs_to :workflow_transition
  belongs_to :service_action
end

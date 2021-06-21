class WorkflowTransition < ApplicationRecord
  belongs_to :workflow
  belongs_to :source_state, class_name: 'WorkflowState'
  belongs_to :target_state, class_name: 'WorkflowState'

  validates :name, :presence => true
  validates_uniqueness_of :name, :scope => [:workflow_id]
end

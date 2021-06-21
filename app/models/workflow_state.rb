class WorkflowState < ApplicationRecord
  belongs_to :workflow
  has_many :workflow_transitions, foreign_key: 'source_state_id'

  validates :name, :presence => true
  validates_uniqueness_of :name, :scope => [:workflow_id]
end

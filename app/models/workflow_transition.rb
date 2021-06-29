class WorkflowTransition < ApplicationRecord
  belongs_to :workflow
  belongs_to :source_state, class_name: 'WorkflowState'
  belongs_to :target_state, class_name: 'WorkflowState'
  has_many :workflow_transition_roles, dependent: :destroy
  has_many :roles, through: :workflow_transition_roles

  has_many :workflow_transition_actions, dependent: :destroy
  has_many :service_actions, through: :workflow_transition_actions

  validates :name, :presence => true
  validates_uniqueness_of :name, :scope => [:workflow_id]

  accepts_nested_attributes_for :workflow_transition_roles, :allow_destroy => true
  accepts_nested_attributes_for :workflow_transition_actions, :allow_destroy => true
end

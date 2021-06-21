class Workflow < ApplicationRecord
    validates :name, :category, :presence => true
    validates_uniqueness_of :name, :scope => [:category]

    has_many :workflow_states, dependent: :destroy
    has_many :workflow_transitions, dependent: :destroy

    amoeba do
        enable
      end
end

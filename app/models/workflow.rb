class Workflow < ApplicationRecord
    validates :name, :category, :presence => true
    validates_uniqueness_of :name, :scope => [:category]
end

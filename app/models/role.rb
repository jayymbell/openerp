class Role < ApplicationRecord
    has_many :project_customer_roles, dependent: :destroy
    validates :name, :category, :presence => true
    validates_uniqueness_of :name, :scope => [:category]
end

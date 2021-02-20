class ProjectCustomer < ApplicationRecord
  belongs_to :project
  belongs_to :customer
  has_many :project_customer_roles, dependent: :destroy
  accepts_nested_attributes_for :project_customer_roles, :allow_destroy => true
  validates_uniqueness_of :project_id, :scope => [:customer_id]
end

class ProjectCustomer < ApplicationRecord
  belongs_to :project
  belongs_to :customer
  validates_uniqueness_of :project_id, :scope => [:customer_id]
end

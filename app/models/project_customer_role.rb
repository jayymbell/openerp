class ProjectCustomerRole < ApplicationRecord
  belongs_to :project_customer, optional: true
  belongs_to :role
end

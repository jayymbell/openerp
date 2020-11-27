class ProjectCustomerRole < ApplicationRecord
  belongs_to :project_customer
  belongs_to :role
end

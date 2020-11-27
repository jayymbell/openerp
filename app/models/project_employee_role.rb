class ProjectEmployeeRole < ApplicationRecord
  belongs_to :project_employee
  belongs_to :role
end

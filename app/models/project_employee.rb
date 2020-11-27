class ProjectEmployee < ApplicationRecord
  belongs_to :project
  belongs_to :employee
  validates_uniqueness_of :project_id, :scope => [:employee_id]
end

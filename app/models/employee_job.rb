class EmployeeJob < ApplicationRecord
  belongs_to :employee
  belongs_to :job
  validates_uniqueness_of :job_id, :scope => [:employee_id]
end

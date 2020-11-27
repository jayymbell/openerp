class EmployeeDepartment < ApplicationRecord
  belongs_to :employee
  belongs_to :department
  validates_uniqueness_of :department_id, :scope => [:employee_id]
end

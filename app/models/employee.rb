class Employee < ApplicationRecord
  belongs_to :person
  has_many :employee_departments
  has_many :departments, through: :employee_departments
  has_many :employee_jobs
  has_many :jobs, through: :employee_jobs
  has_many :service_employees
  has_many :services, through: :service_employees
end

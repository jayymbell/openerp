class Employee < ApplicationRecord
  belongs_to :person
  has_many :employee_departments, dependent: :destroy
  has_many :departments, through: :employee_departments
  has_many :employee_jobs, dependent: :destroy
  has_many :jobs, through: :employee_jobs
  has_many :service_employees, dependent: :destroy
  has_many :services, through: :service_employees
  belongs_to :supervisor, foreign_key: 'supervisor_id',class_name: 'Employee', optional: true
end

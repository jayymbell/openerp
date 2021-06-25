class Employee < ApplicationRecord
  belongs_to :person
  has_many :employee_departments, dependent: :destroy
  has_many :departments, through: :employee_departments
  has_many :employee_jobs, dependent: :destroy
  has_many :jobs, through: :employee_jobs
  has_many :service_employees, dependent: :destroy
  has_many :services, through: :service_employees
  has_many :project_employees, dependent: :destroy
  has_many :projects, through: :project_employees
  has_many :purchase_order_efforts
  has_many :purchase_orders, through: :purchase_order_efforts
  belongs_to :supervisor, foreign_key: 'supervisor_id',class_name: 'Employee', optional: true
end

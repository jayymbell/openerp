class Department < ApplicationRecord
  belongs_to :parent_department, optional: true
  has_many :employee_departments
  has_many :employees, through: :employee_departments
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  
end

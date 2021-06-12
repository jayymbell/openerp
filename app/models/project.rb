class Project < ApplicationRecord
    has_many :project_customers, dependent: :destroy
    has_many :customers, through: :project_customers
    has_many :project_employees, dependent: :destroy
    has_many :employees, through: :project_employees
    has_many :purchase_orders
    has_many :invoices, through: :purchase_orders
    has_many :work_orders
    validates :name, presence: true, uniqueness: {case_sensitive: false}
end

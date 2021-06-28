class Service < ApplicationRecord
    validates :name, presence: true, uniqueness: {case_sensitive: false}
    has_many :service_employees, dependent: :destroy
    has_many :employees, through: :service_employees
    has_many :service_actions
end

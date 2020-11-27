class Job < ApplicationRecord
    has_many :employee_jobs
    has_many :employees, through: :employee_jobs
    validates :name, presence: true, uniqueness: {case_sensitive: false}
end

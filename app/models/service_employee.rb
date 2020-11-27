class ServiceEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :service

  validates_uniqueness_of :service_id, :scope => [:employee_id]
end

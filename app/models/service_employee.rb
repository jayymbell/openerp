class ServiceEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :service
end

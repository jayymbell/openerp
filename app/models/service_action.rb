class ServiceAction < ApplicationRecord
  belongs_to :service
  validates :name, presence: true
  validates_uniqueness_of :name, :scope => [:service_id]
end

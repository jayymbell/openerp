class Customer < ApplicationRecord
  belongs_to :person
  has_many :customer_organizations
  has_many :organizations, through: :customer_organizations
  has_many :project_customers, dependent: :destroy
  has_many :projects, through: :project_customers
end

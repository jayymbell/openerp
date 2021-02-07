class Organization < ApplicationRecord
    has_many :customer_organizations
    has_many :customers, through: :customer_organizations
    validates :name, presence: true, uniqueness: {case_sensitive: false}
    validates :name, presence: true, uniqueness: {case_sensitive: false}
end

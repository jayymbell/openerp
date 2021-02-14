class PurchaseOrder < ApplicationRecord
  belongs_to :project
  belongs_to :customer
  has_many :invoices
  has_many :purchase_order_services, dependent: :destroy
  accepts_nested_attributes_for :purchase_order_services, :allow_destroy => true
end

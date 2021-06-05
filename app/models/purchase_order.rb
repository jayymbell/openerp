class PurchaseOrder < ApplicationRecord
  belongs_to :project
  belongs_to :customer
  has_many :invoices
  has_many :purchase_order_services, dependent: :destroy
  has_many :purchase_order_efforts, dependent: :destroy
  accepts_nested_attributes_for :purchase_order_services, :allow_destroy => true
  accepts_nested_attributes_for :purchase_order_efforts, :allow_destroy => true

  validates_uniqueness_of :name, :scope => [:customer_id]

  amoeba do
    enable
  end

  def total
    purchase_order_services.sum(:total) + purchase_order_efforts.sum(:total)
  end
  
end

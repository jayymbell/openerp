class PurchaseOrder < ApplicationRecord
  belongs_to :project
  belongs_to :customer
  has_many :invoices
  has_many :purchase_order_services, dependent: :destroy
  has_many :purchase_order_efforts, dependent: :destroy
  has_many :purchase_order_events, dependent: :destroy
  has_many :invoices
  has_many :work_order_invoices, through: :invoices
  has_many :work_orders, through: :work_order_invoices
  belongs_to :workflow_state
  belongs_to :workflow

  accepts_nested_attributes_for :purchase_order_services, :allow_destroy => true
  accepts_nested_attributes_for :purchase_order_efforts, :allow_destroy => true

  validates_uniqueness_of :name, :scope => [:customer_id, :project_id]

  amoeba do
    enable
  end

  def total
    purchase_order_services.sum(:total) + purchase_order_efforts.sum(:total)
  end

  def total_amount_invoiced
    invoices.sum(:total)
  end

  def duration
    (self.ends_on - self.starts_on).to_i + 1
  end
  
end

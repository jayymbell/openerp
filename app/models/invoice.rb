class Invoice < ApplicationRecord
  belongs_to :project
  belongs_to :purchase_order
  belongs_to :workflow_state
  has_many :invoice_lines, dependent: :destroy
  has_many :work_order_invoices, dependent: :destroy

  accepts_nested_attributes_for :invoice_lines, :allow_destroy => true
  accepts_nested_attributes_for :work_order_invoices, :allow_destroy => true

  validates  :starts_on, :ends_on, :total, presence: true

  amoeba do
    enable
  end
end

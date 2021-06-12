class Invoice < ApplicationRecord
  belongs_to :project
  belongs_to :purchase_order
  has_many :invoice_lines, dependent: :destroy

  accepts_nested_attributes_for :invoice_lines, :allow_destroy => true

  validates  :starts_on, :ends_on, :total, presence: true

  amoeba do
    enable
  end
end

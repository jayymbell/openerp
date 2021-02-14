class PurchaseOrderEffort < ApplicationRecord
  belongs_to :purchase_order, optional: true
  belongs_to :employee
end

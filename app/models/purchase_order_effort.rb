class PurchaseOrderEffort < ApplicationRecord
  belongs_to :purchase_order, optional: true
  belongs_to :employee, optional: true
  belongs_to :job
end

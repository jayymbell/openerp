class PurchaseOrderEffort < ApplicationRecord
  belongs_to :purchase_order_service
  belongs_to :employee
end

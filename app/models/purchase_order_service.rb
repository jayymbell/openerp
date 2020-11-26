class PurchaseOrderService < ApplicationRecord
  belongs_to :purchase_order
  belongs_to :service
end

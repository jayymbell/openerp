class PurchaseOrderService < ApplicationRecord
  belongs_to :purchase_order, optional: true
  belongs_to :service
end

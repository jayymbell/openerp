class PurchaseOrderEvent < ApplicationRecord
  belongs_to :purchase_order
  belongs_to :actor, class_name: "User"
end
